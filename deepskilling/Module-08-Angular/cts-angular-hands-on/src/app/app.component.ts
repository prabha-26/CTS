import { Component } from '@angular/core';
import { RouterLink, RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterLink, RouterOutlet],
  template: `
    <header>
      <h1>CTS Academy Courses</h1>
      <nav>
        <a routerLink="/">Courses</a>
        <a routerLink="/add">Add Course</a>
      </nav>
    </header>
    <main>
      <router-outlet></router-outlet>
    </main>
  `,
  styles: [`
    header { background: #0f766e; color: white; padding: 18px 28px; }
    h1 { margin: 0 0 10px; font-size: 24px; }
    nav { display: flex; gap: 16px; }
    a { color: white; font-weight: 700; text-decoration: none; }
    main { padding: 28px; }
  `]
})
export class AppComponent {}
