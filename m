From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: PROBLEM: consolidated IDT invalidation causes kexec to reboot
Date: Wed, 27 Dec 2017 20:30:16 -0500
Message-ID: <20171228013016.GA19799@char.us.oracle.com>
References: <20171224014415.GA5663@chirva-void>
 <CA+55aFypaeWzKh=wmwdw0PmMsVyP98hts5doC7CMtAH4095KTA@mail.gmail.com>
 <CALCETrWFK0kY7ety3Hsipi3W3Ni-sm2vQ5kbi3N_OhExNrMmHw@mail.gmail.com>
 <20171225212934.GA1410@arch-chirva.localdomain>
 <CA+55aFxWRTsU-ys1BjabhrxoikFnYspePm37UQcsBwC9vD9roA@mail.gmail.com>
 <20171226231900.GB1410@arch-chirva.localdomain>
 <CA+55aFzU8tRSuCoS2TmXjGZ5WRUzMCrG6Jk4eNCQZjP+5sVE9w@mail.gmail.com>
 <A0C04B15-956D-47C7-ABBA-3D30C2299F62@zytor.com>
 <CA+55aFwyOq4-uXrSNOrFoxfCPJZAdMGdXnUDUHi=gTy+CcYmvQ@mail.gmail.com>
 <8678ABA7-1195-468D-8252-94D7ED0794B6@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8678ABA7-1195-468D-8252-94D7ED0794B6@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hpa@zytor.com, xen-devel@lists.xensource.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexandru Chirvasitu <achirvasub@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, kernel list <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>, Denys Vlasenko <dvlasenk@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>
List-Id: xen-devel@lists.xenproject.org

On Tue, Dec 26, 2017 at 07:00:43PM -0800, hpa@zytor.com wrote:
> On December 26, 2017 6:54:55 PM PST, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >On Tue, Dec 26, 2017 at 6:25 PM,  <hpa@zytor.com> wrote:
> >>
> >> This is why I personally prefer to see these kinds of terminal stubs
> >written in assembly explicitly: the C compiler simply doesn't have all
> >the information needed to do the right thing.
> >>
> >> I'm personally very sceptical to nuking the GDT unless we're in real
> >mode.  There seems to be no point, and just opens up failure modes.
> >
> >Agreed, but I think it was originally probably done for that exact
> >reason: to explicitly trigger issues if somebody did something odd.
> >
> >That said, this time it's actually the "load_segments()" that causes
> >the real problem, and the GDT and IDT invalidation shouldn't have
> >actually done anything at all, since we shouldn't actually be taking
> >faults or loading segments.
> >
> >And historically that segment reset didn't matter either, because
> >apparently we don't do any percpu stuff either. And the stack canary
> >use for %gs is actually fairly recent (well, "recent" is relative: the
> >stack protector code goes back to 2006, but the load_segments() use
> >predates that.
> >
> >So I think we should actually fix "load_segments()" to not load fs/gs
> >with __KERNEL_DS, but with __KERNEL_PERCPU and __KERNEL_STACK_CANARY
> >respectively.
> >
> >... and yes, we should also look at the idt/gdt invalidation, but I
> >wonder if the paravirt code might want to trigger there for people. Do
> >people do kexec under paravirt?

Not anymore. The kexec loading under hypervisors (say Xen) ends up making
hypercalls directly and loads the kernel in the hypervisor bypassing the Linux
kexec machinery.

If the Linux kernel hits a crash it makes an hypercall - and the hypervisor
continues with its own kexec invocation.

Not sure how KVM does it (which also uses some paravirt functionality).
> >
> >                 Linus
> 
> It's not paravirt, but also broken HVM hypervisors, sadly.  Some versions of Xen HVM would shite itself if the memory that the GDT or IDT pointers were in was overwritten, and these functions seem to put them on the stack.

Are you sure? I do remember the Xen PV ABI being a trainwreck, but
I don't recall anything in the HVM paths being so oddball as this?
Would you remember the links / context of this?

CCing xen-devel folks in case they recall.

> -- 
> Sent from my Android device with K-9 Mail. Please excuse my brevity.
