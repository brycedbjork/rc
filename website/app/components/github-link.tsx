"use client";

import { useState, useEffect } from "react";
import { Github, Star } from "lucide-react";

export function GitHubLink({ className = "" }: { className?: string }) {
  const [stars, setStars] = useState<number | null>(null);

  useEffect(() => {
    fetch("https://api.github.com/repos/north-brook/remote-control", {
      headers: { Accept: "application/vnd.github.v3+json" },
    })
      .then((r) => r.json())
      .then((d) => {
        if (typeof d.stargazers_count === "number")
          setStars(d.stargazers_count);
      })
      .catch(() => {});
  }, []);

  return (
    <a
      href="https://github.com/north-brook/remote-control"
      target="_blank"
      rel="noopener noreferrer"
      className={`flex items-center gap-1.5 rounded-lg border border-white/10 px-3 py-1.5 text-sm text-zinc-400 hover:border-white/20 hover:text-zinc-200 transition-colors ${className}`}
    >
      <Github size={16} />
      {stars !== null && (
        <>
          <Star className="fill-amber-400 text-amber-400" size={12} />
          <span className="tabular-nums">{stars}</span>
        </>
      )}
    </a>
  );
}
