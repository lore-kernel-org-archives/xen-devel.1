From: Andres Lagar Cavilla <andres@lagarcavilla.org>
Subject: Re: AD bits in traditional PV mode
Date: Thu, 22 Feb 2018 11:46:59 -0800
Message-ID: <CADzFZPtfReAiRanYXEFkNwB8Vc3D53Qu1m=-3L0a22CD_n81Wg@mail.gmail.com>
References: <CADzFZPuuhrMQa2zCrYimeLghVc2re_3KoB8R0szfV-H1bK=cuA@mail.gmail.com>
 <7bbbac01-2aab-5705-8a48-4d588413eb8a@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5872394038121484304=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7bbbac01-2aab-5705-8a48-4d588413eb8a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============5872394038121484304==
Content-Type: multipart/alternative; boundary="f4f5e8079970aa05eb0565d24e8f"

--f4f5e8079970aa05eb0565d24e8f
Content-Type: text/plain; charset="UTF-8"

Thanks for the clarification, Andrew.

On Tue, Feb 20, 2018 at 5:20 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 21/02/2018 00:42, Andres Lagar Cavilla wrote:
> > Hello everyone,
> >
> > I was thinking of the traditional Xen PV mode in which page table
> > pages are write protected from guest meddling and PTE
> > modifications are audited by the hypervisor (ptwr_emulated_update()
> > these days, still?).
>
> Something like that, yes.  Alternatively, via explicit hypercall which
> is faster than the trap&emulate path.
>
> > Without software shadows or paging to e.g. an EPT, native PV loads the
> > actual CR3 pointing to a write protected page table tree.
>
> Unfortunately, I've lost you here.  There is no such thing as a
> write-protected pagetable tree in the traditional PV sense.
>
> > When the cr3 is loaded, the hardware walker will want to set A and D
> > bits in PTEs -- is this action immune to the write protection in the
> > page table pages themselves? Or do we take emulation faults on these
> > updates as well?
>
> The protection that Xen enforces on PV guests is that an L1 PTE mapping
> a pagetable frame must never be writeable.  This protection happens at
> the linear address level.  When the CPU pagewalker tries to set A/D
> bits, it issues an atomic update to the physical address of the
> pagetable entry which needs updating.
>
> As with everything, there are complicating factors.  With EPT/NPT for
> HVM guests these days, the hypervisor can also apply permissions to
> guest physical addresses, as part of their translation to host physical
> addresses.  The hardware pagewalker, when attempting to set an A/D bit
> of the HVM guests regular pagetables, issues an EPT/NPT write (well -
> RMW strictly) to set the bits.
>
> Therefore, if the hypervisor marks an HVM guest's pagetable as
> read-only, then the hardware pagewalker trying to set A/D bits will
> vmexit with an EPT/NPT permissions violation.  This is one major
> performance limiting factor of introspection technology at the moment.
>

Indeed, this is what I was coming at. In my experience guests will be very
adversely affected if we just latch the D bits to 1 unilaterally (it's
legal to do so by the "hardware"), as they will be led to believe file
cache pages are in constant need of writeback. (and A bits latched to 1
turn e.g. Linux's vmscan.c into a crapshoot)

So this is currently not too hopeful

Thanks again
Andres

>
> ~Andrew
>

--f4f5e8079970aa05eb0565d24e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the clarification, Andrew.<div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Tue, Feb 20, 2018 at 5:20 PM, Andre=
w Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.cooper3@citrix.com"=
 target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><span class=3D"">On 21/02/2018 00:42, Andres Laga=
r Cavilla wrote:<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; I was thinking of the traditional Xen PV mode in which page table<br>
&gt; pages are write protected from guest meddling and PTE<br>
&gt; modifications=C2=A0are audited by the hypervisor (ptwr_emulated_update=
()<br>
&gt; these days, still?).<br>
<br>
</span>Something like that, yes.=C2=A0 Alternatively, via explicit hypercal=
l which<br>
is faster than the trap&amp;emulate path.<br>
<span class=3D""><br>
&gt; Without software shadows or paging to e.g. an EPT, native PV loads the=
<br>
&gt; actual CR3 pointing to a write protected page table tree.<br>
<br>
</span>Unfortunately, I&#39;ve lost you here.=C2=A0 There is no such thing =
as a<br>
write-protected pagetable tree in the traditional PV sense.<br>
<span class=3D""><br>
&gt; When the cr3 is loaded, the hardware walker will want to set A and D<b=
r>
&gt; bits in PTEs -- is this action immune to the write protection in the<b=
r>
&gt; page table pages themselves? Or do we take emulation faults on these<b=
r>
&gt; updates as well?<br>
<br>
</span>The protection that Xen enforces on PV guests is that an L1 PTE mapp=
ing<br>
a pagetable frame must never be writeable.=C2=A0 This protection happens at=
<br>
the linear address level.=C2=A0 When the CPU pagewalker tries to set A/D<br=
>
bits, it issues an atomic update to the physical address of the<br>
pagetable entry which needs updating.<br>
<br>
As with everything, there are complicating factors.=C2=A0 With EPT/NPT for<=
br>
HVM guests these days, the hypervisor can also apply permissions to<br>
guest physical addresses, as part of their translation to host physical<br>
addresses.=C2=A0 The hardware pagewalker, when attempting to set an A/D bit=
<br>
of the HVM guests regular pagetables, issues an EPT/NPT write (well -<br>
RMW strictly) to set the bits.<br>
<br>
Therefore, if the hypervisor marks an HVM guest&#39;s pagetable as<br>
read-only, then the hardware pagewalker trying to set A/D bits will<br>
vmexit with an EPT/NPT permissions violation.=C2=A0 This is one major<br>
performance limiting factor of introspection technology at the moment.<br><=
/blockquote><div><br></div><div>Indeed, this is what I was coming at. In my=
 experience guests will be very adversely affected if we just latch the D b=
its to 1 unilaterally (it&#39;s legal to do so by the &quot;hardware&quot;)=
, as they will be led to believe file cache pages are in constant need of w=
riteback. (and A bits latched to 1 turn e.g. Linux&#39;s vmscan.c into a cr=
apshoot)</div><div><br></div><div>So this is currently not too hopeful</div=
><div><br></div><div>Thanks again</div><div>Andres=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
~Andrew<br>
</font></span></blockquote></div><br></div></div>

--f4f5e8079970aa05eb0565d24e8f--


--===============5872394038121484304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5872394038121484304==--
