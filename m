From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: RT Xen on ARM - R-Car series
Date: Tue, 5 Feb 2019 11:18:08 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902051116400.22962@sstabellini-ThinkPad-X260>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <d1cd35de-b278-aad8-49ec-8d77666cbdd5@gmail.com>
 <CACrvCsaYBv2p2Fsu9+Y8Ewu=qrOY6erOdBBRo+JHvuzqA0f7Zg@mail.gmail.com>
 <15f42687-9aa6-e9ed-c306-b6b267a16292@arm.com>
 <78963b40-e8e8-db41-ee16-d4ca64baa37a@gmail.com>
 <201eb8d4-aa51-9ad3-e655-3f4fa0cee348@arm.com>
 <c5f1b8c6-df0a-d30a-4ca6-3d9372c7913c@gmail.com>
 <4e777fcf-6630-5aff-a8d2-781d3f705123@arm.com>
 <alpine.DEB.2.10.1901311345570.22962@sstabellini-ThinkPad-X260>
 <9c4bc70d-a694-6269-f14a-1d9797dce59f@gmail.com>
 <9b0fe0b8-48cb-e04d-5d4e-a970f6ce2609@arm.com>
 <4dc47732-62fb-5782-d7fd-2d1819c49558@gmail.com>
 <5b9dd69a-1f75-eb3b-4040-822520f0cc08@arm.com>
 <8355b5ee-ff8d-78b2-86aa-5a2376f33ee5@gmail.com>
 <3de8170e-fe56-e5a2-d94d-1c024c49cef7@arm.com>
 <0e9ee915-4c5d-8743-d605-a8f9f7b96a3b@gmail.com>
 <4f5c623d-ac64-a188-f20b-fa60166183e8@arm.com>
 <ca035ab4-42c4-f397-c021-e9247761bef3@gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-87214066-1549394289=:22962"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ca035ab4-42c4-f397-c021-e9247761bef3@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "LOPEZ,
 FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-87214066-1549394289=:22962
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 5 Feb 2019, Andrii Anisov wrote:
> On 05.02.19 00:06, Julien Grall wrote:
> > > A57+A53.
> > > 
> > > I see the following in my log:
> > > 
> > >      (XEN) alternatives: Patching with alt table 00000000002c6608 ->
> > > 00000000002c6c80
> > >      (XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > >      (XEN) CPU2 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > >      (XEN) CPU3 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > >      (XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
> > 
> > Cortex-A53 should not be affected by spectre v2, so I imagine they are only
> > for A57?
> Yes, the log says the workaround is applied to the big cores only. As it
> should be.
> 
> > It is going to be hard to disable the workarounds by default. But we can
> > consider to provide host-wide or per-guest option to disable them on trusted
> > environment.
> We have to get numbers first than decide how to proceed.
> 
> > > > Also, when you mean possible, does it mean you haven't looked the
> > > > performance regression?
> > > We have a preliminary results about performance drop with xen4.12-unstable
> > > comparing to a our system with 4.10.
> > 
> > A lot of patches have not been backported in Xen 4.10 (including
> > Spectre/Meltdown) that will definitely fix hole but may have an impact on
> > the performance. There were not backported because of performance reason but
> > because of the complexity of the port and seemly lack of interest.
> I know that story. But customers are customers. And performance drop in the
> next SW version is always painful for them.
> So we need a good explanation (which Spectre mitigation might be), or better
> to show up no performance drop :).

I think it is acceptable to intruduce a "I know what I am doing, just
disable the fix" option. There might be cases where the user doesn't
care for Spectre mitigations. I see that Linux is going in this
direction of offering more disabling options too.
--8323329-87214066-1549394289=:22962
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-87214066-1549394289=:22962--
