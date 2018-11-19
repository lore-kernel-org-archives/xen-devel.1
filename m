From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 19 Nov 2018 16:42:36 +0000
Message-ID: <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
 <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7500084602408146599=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============7500084602408146599==
Content-Type: multipart/alternative; boundary="000000000000054956057b073507"

--000000000000054956057b073507
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Nov 2018, 15:57 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> Julien,
>
>
> It's me again about your patch:)
>
> I've found this patch useful and even can give a motivation to have it
> in the mainline. The patch ensures that vgic_sync_from_lrs is performed
> on guest to hyp switch prior to any IRQ processing.
>



There are no issue about processing IRQs before the syncs. It is the same
as if an IRQ was raised from ila different pCPUs. So why do you need that?


> So, do you plan to push it for review? Could I do that on behalf of you?
>

Unless there are any bug with current code, then I don't plan to merge it.

Cheers,


>
> On 09.11.18 16:42, Andrii Anisov wrote:
> > Hello Julien,
> >
> > I just wonder, do you plan to upstream the patch below?
> >
> > Andrii Anisov
> >
> >
> >
> > commit 11e360b93be81a58a41832d714f33f797ad312a9
> > Author: Julien Grall <julien.grall@arm.com>
> > Date:   Mon Oct 29 13:32:56 2018 +0000
> >
> >       xen/arm: Re-enable interrupt later in the trap path
> >
> >       Signed-off-by: Julien Grall <julien.grall@arm.com>
> >
> > diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> > index 97b05f53ea..8f287891b6 100644
> > --- a/xen/arch/arm/arm64/entry.S
> > +++ b/xen/arch/arm/arm64/entry.S
> > @@ -195,7 +195,6 @@ hyp_error_invalid:
> >
> >    hyp_error:
> >            entry   hyp=1
> > -        msr     daifclr, #2
> >            mov     x0, sp
> >            bl      do_trap_hyp_serror
> >            exit    hyp=1
> > @@ -203,7 +202,7 @@ hyp_error:
> >    /* Traps taken in Current EL with SP_ELx */
> >    hyp_sync:
> >            entry   hyp=1
> > -        msr     daifclr, #6
> > +        msr     daifclr, #4
> >            mov     x0, sp
> >            bl      do_trap_hyp_sync
> >            exit    hyp=1
> > @@ -304,7 +303,7 @@ guest_sync_slowpath:
> >            ALTERNATIVE("bl check_pending_vserror; cbnz x0, 1f",
> >                        "nop; nop",
> >                        SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT)
> > -        msr     daifclr, #6
> > +        msr     daifclr, #4
> >            mov     x0, sp
> >            bl      do_trap_guest_sync
> >    1:
> > @@ -332,7 +331,7 @@ guest_fiq_invalid:
> >
> >    guest_error:
> >            entry   hyp=0, compat=0
> > -        msr     daifclr, #6
> > +        msr     daifclr, #4
> >            mov     x0, sp
> >            bl      do_trap_guest_serror
> >            exit    hyp=0, compat=0
> > @@ -347,7 +346,7 @@ guest_sync_compat:
> >            ALTERNATIVE("bl check_pending_vserror; cbnz x0, 1f",
> >                        "nop; nop",
> >                        SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT)
> > -        msr     daifclr, #6
> > +        msr     daifclr, #4
> >            mov     x0, sp
> >            bl      do_trap_guest_sync
> >    1:
> > @@ -375,7 +374,7 @@ guest_fiq_invalid_compat:
> >
> >    guest_error_compat:
> >            entry   hyp=0, compat=1
> > -        msr     daifclr, #6
> > +        msr     daifclr, #4
> >            mov     x0, sp
> >            bl      do_trap_guest_serror
> >            exit    hyp=0, compat=1
> > diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > index 51d2e42c77..c18f89b41f 100644
> > --- a/xen/arch/arm/traps.c
> > +++ b/xen/arch/arm/traps.c
> > @@ -2039,6 +2039,8 @@ static void enter_hypervisor_head(struct
> cpu_user_regs *regs)
> >        {
> >            struct vcpu *v = current;
> >
> > +        ASSERT(!local_irq_is_enabled());
> > +
> >            /* If the guest has disabled the workaround, bring it back
> on. */
> >            if ( needs_ssbd_flip(v) )
> >                arm_smccc_1_1_smc(ARM_SMCCC_ARCH_WORKAROUND_2_FID, 1,
> NULL);
> > @@ -2073,6 +2075,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
> >        const union hsr hsr = { .bits = regs->hsr };
> >
> >        enter_hypervisor_head(regs);
> > +    local_irq_enable();
> >
> >        switch ( hsr.ec )
> >        {
> > @@ -2208,6 +2211,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
> >        const union hsr hsr = { .bits = regs->hsr };
> >
> >        enter_hypervisor_head(regs);
> > +    local_irq_enable();
> >
> >        switch ( hsr.ec )
> >        {
> > @@ -2246,6 +2250,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
> >    void do_trap_hyp_serror(struct cpu_user_regs *regs)
> >    {
> >        enter_hypervisor_head(regs);
> > +    local_irq_enable();
> >
> >        __do_trap_serror(regs, VABORT_GEN_BY_GUEST(regs));
> >    }
> > @@ -2253,6 +2258,7 @@ void do_trap_hyp_serror(struct cpu_user_regs *regs)
> >    void do_trap_guest_serror(struct cpu_user_regs *regs)
> >    {
> >        enter_hypervisor_head(regs);
> > +    local_irq_enable();
> >
> >        __do_trap_serror(regs, true);
> >    }
> >
> --
> Sincerely,
> Andrii Anisov.
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000054956057b073507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+T24gTW9uLCAx
OSBOb3YgMjAxOCwgMTU6NTcgQW5kcmlpIEFuaXNvdiwgJmx0OzxhIGhyZWY9Im1haWx0bzphbmRy
aWkuYW5pc292QGdtYWlsLmNvbSI+YW5kcmlpLmFuaXNvdkBnbWFpbC5jb208L2E+Jmd0OyB3cm90
ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+
SnVsaWVuLDxicj4NCjxicj4NCjxicj4NCkl0JiMzOTtzIG1lIGFnYWluIGFib3V0IHlvdXIgcGF0
Y2g6KTxicj4NCjxicj4NCkkmIzM5O3ZlIGZvdW5kIHRoaXMgcGF0Y2ggdXNlZnVsIGFuZCBldmVu
IGNhbiBnaXZlIGEgbW90aXZhdGlvbiB0byBoYXZlIGl0IDxicj4NCmluIHRoZSBtYWlubGluZS4g
VGhlIHBhdGNoIGVuc3VyZXMgdGhhdCB2Z2ljX3N5bmNfZnJvbV9scnMgaXMgcGVyZm9ybWVkIDxi
cj4NCm9uIGd1ZXN0IHRvIGh5cCBzd2l0Y2ggcHJpb3IgdG8gYW55IElSUSBwcm9jZXNzaW5nLjxi
cj48L2Jsb2NrcXVvdGU+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48
YnI+VGhlcmUgYXJlIG5vIGlzc3VlIGFib3V0IHByb2Nlc3NpbmcgSVJRcyBiZWZvcmUgdGhlIHN5
bmNzLiBJdCBpcyB0aGUgc2FtZSBhcyBpZiBhbiBJUlEgd2FzIHJhaXNlZCBmcm9tIGlsYSBkaWZm
ZXJlbnQgcENQVXMuIFNvIHdoeSBkbyB5b3UgbmVlZCB0aGF0PzwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij4NCjxicj4NClNvLCBkbyB5b3UgcGxhbiB0byBwdXNoIGl0IGZvciByZXZp
ZXc/IENvdWxkIEkgZG8gdGhhdCBvbiBiZWhhbGYgb2YgeW91Pzxicj48L2Jsb2NrcXVvdGU+PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Vbmxlc3MgdGhlcmUgYXJlIGFueSBidWcgd2l0aCBjdXJy
ZW50IGNvZGUsIHRoZW4gSSBkb24mIzM5O3QgcGxhbiB0byBtZXJnZSBpdC48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PkNoZWVycyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFp
bF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAg
MCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8
YnI+DQo8YnI+DQpPbiAwOS4xMS4xOCAxNjo0MiwgQW5kcmlpIEFuaXNvdiB3cm90ZTo8YnI+DQom
Z3Q7IEhlbGxvIEp1bGllbiw8YnI+DQomZ3Q7PGJyPg0KJmd0OyBJIGp1c3Qgd29uZGVyLCBkbyB5
b3UgcGxhbiB0byB1cHN0cmVhbSB0aGUgcGF0Y2ggYmVsb3c/PGJyPg0KJmd0Ozxicj4NCiZndDsg
QW5kcmlpIEFuaXNvdjxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgY29t
bWl0IDExZTM2MGI5M2JlODFhNThhNDE4MzJkNzE0ZjMzZjc5N2FkMzEyYTk8YnI+DQomZ3Q7IEF1
dGhvcjogSnVsaWVuIEdyYWxsICZsdDs8YSBocmVmPSJtYWlsdG86anVsaWVuLmdyYWxsQGFybS5j
b20iIHRhcmdldD0iX2JsYW5rIj5qdWxpZW4uZ3JhbGxAYXJtLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0
OyBEYXRlOsKgwqAgTW9uIE9jdCAyOSAxMzozMjo1NiAyMDE4ICswMDAwPGJyPg0KJmd0Ozxicj4N
CiZndDvCoCDCoMKgwqDCoCB4ZW4vYXJtOiBSZS1lbmFibGUgaW50ZXJydXB0IGxhdGVyIGluIHRo
ZSB0cmFwIHBhdGg8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKgwqDCoMKgIFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmp1bGllbi5ncmFsbEBhcm0uY29tIiB0
YXJnZXQ9Il9ibGFuayI+anVsaWVuLmdyYWxsQGFybS5jb208L2E+Jmd0Ozxicj4NCiZndDs8YnI+
DQomZ3Q7IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvZW50cnkuUyBiL3hlbi9hcmNo
L2FybS9hcm02NC9lbnRyeS5TPGJyPg0KJmd0OyBpbmRleCA5N2IwNWY1M2VhLi44ZjI4Nzg5MWI2
IDEwMDY0NDxicj4NCiZndDsgLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlM8YnI+DQom
Z3Q7ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TPGJyPg0KJmd0OyBAQCAtMTk1LDcg
KzE5NSw2IEBAIGh5cF9lcnJvcl9pbnZhbGlkOjxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgaHlw
X2Vycm9yOjxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZW50cnnCoMKgIGh5cD0xPGJy
Pg0KJmd0OyAtwqDCoMKgwqDCoMKgwqAgbXNywqDCoMKgwqAgZGFpZmNsciwgIzI8YnI+DQomZ3Q7
wqAgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoMKgIHgwLCBzcDxicj4NCiZndDvCoCDCoMKg
wqDCoMKgwqDCoMKgwqAgYmzCoMKgwqDCoMKgIGRvX3RyYXBfaHlwX3NlcnJvcjxicj4NCiZndDvC
oCDCoMKgwqDCoMKgwqDCoMKgwqAgZXhpdMKgwqDCoCBoeXA9MTxicj4NCiZndDsgQEAgLTIwMyw3
ICsyMDIsNyBAQCBoeXBfZXJyb3I6PGJyPg0KJmd0O8KgIMKgIC8qIFRyYXBzIHRha2VuIGluIEN1
cnJlbnQgRUwgd2l0aCBTUF9FTHggKi88YnI+DQomZ3Q7wqAgwqAgaHlwX3N5bmM6PGJyPg0KJmd0
O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBlbnRyecKgwqAgaHlwPTE8YnI+DQomZ3Q7IC3CoMKgwqDC
oMKgwqDCoCBtc3LCoMKgwqDCoCBkYWlmY2xyLCAjNjxicj4NCiZndDsgK8KgwqDCoMKgwqDCoMKg
IG1zcsKgwqDCoMKgIGRhaWZjbHIsICM0PGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBt
b3bCoMKgwqDCoCB4MCwgc3A8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgIGJswqDCoMKg
wqDCoCBkb190cmFwX2h5cF9zeW5jPGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBleGl0
wqDCoMKgIGh5cD0xPGJyPg0KJmd0OyBAQCAtMzA0LDcgKzMwMyw3IEBAIGd1ZXN0X3N5bmNfc2xv
d3BhdGg6PGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBBTFRFUk5BVElWRSgmcXVvdDti
bCBjaGVja19wZW5kaW5nX3ZzZXJyb3I7IGNibnogeDAsIDFmJnF1b3Q7LDxicj4NCiZndDvCoCDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7bm9wOyBub3Am
cXVvdDssPGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBTS0lQX1NZTkNIUk9OSVpFX1NFUlJPUl9FTlRSWV9FWElUKTxicj4NCiZndDsgLcKgwqDC
oMKgwqDCoMKgIG1zcsKgwqDCoMKgIGRhaWZjbHIsICM2PGJyPg0KJmd0OyArwqDCoMKgwqDCoMKg
wqAgbXNywqDCoMKgwqAgZGFpZmNsciwgIzQ8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKg
IG1vdsKgwqDCoMKgIHgwLCBzcDxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqAgYmzCoMKg
wqDCoMKgIGRvX3RyYXBfZ3Vlc3Rfc3luYzxicj4NCiZndDvCoCDCoCAxOjxicj4NCiZndDsgQEAg
LTMzMiw3ICszMzEsNyBAQCBndWVzdF9maXFfaW52YWxpZDo8YnI+DQomZ3Q7PGJyPg0KJmd0O8Kg
IMKgIGd1ZXN0X2Vycm9yOjxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZW50cnnCoMKg
IGh5cD0wLCBjb21wYXQ9MDxicj4NCiZndDsgLcKgwqDCoMKgwqDCoMKgIG1zcsKgwqDCoMKgIGRh
aWZjbHIsICM2PGJyPg0KJmd0OyArwqDCoMKgwqDCoMKgwqAgbXNywqDCoMKgwqAgZGFpZmNsciwg
IzQ8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoMKgIHgwLCBzcDxicj4N
CiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqAgYmzCoMKgwqDCoMKgIGRvX3RyYXBfZ3Vlc3Rfc2Vy
cm9yPGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBleGl0wqDCoMKgIGh5cD0wLCBjb21w
YXQ9MDxicj4NCiZndDsgQEAgLTM0Nyw3ICszNDYsNyBAQCBndWVzdF9zeW5jX2NvbXBhdDo8YnI+
DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgIEFMVEVSTkFUSVZFKCZxdW90O2JsIGNoZWNrX3Bl
bmRpbmdfdnNlcnJvcjsgY2JueiB4MCwgMWYmcXVvdDssPGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtub3A7IG5vcCZxdW90Oyw8YnI+
DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNLSVBf
U1lOQ0hST05JWkVfU0VSUk9SX0VOVFJZX0VYSVQpPGJyPg0KJmd0OyAtwqDCoMKgwqDCoMKgwqAg
bXNywqDCoMKgwqAgZGFpZmNsciwgIzY8YnI+DQomZ3Q7ICvCoMKgwqDCoMKgwqDCoCBtc3LCoMKg
wqDCoCBkYWlmY2xyLCAjNDxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKg
wqAgeDAsIHNwPGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBibMKgwqDCoMKgwqAgZG9f
dHJhcF9ndWVzdF9zeW5jPGJyPg0KJmd0O8KgIMKgIDE6PGJyPg0KJmd0OyBAQCAtMzc1LDcgKzM3
NCw3IEBAIGd1ZXN0X2ZpcV9pbnZhbGlkX2NvbXBhdDo8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKg
IGd1ZXN0X2Vycm9yX2NvbXBhdDo8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgIGVudHJ5
wqDCoCBoeXA9MCwgY29tcGF0PTE8YnI+DQomZ3Q7IC3CoMKgwqDCoMKgwqDCoCBtc3LCoMKgwqDC
oCBkYWlmY2xyLCAjNjxicj4NCiZndDsgK8KgwqDCoMKgwqDCoMKgIG1zcsKgwqDCoMKgIGRhaWZj
bHIsICM0PGJyPg0KJmd0O8KgIMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKgwqDCoCB4MCwgc3A8
YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgIGJswqDCoMKgwqDCoCBkb190cmFwX2d1ZXN0
X3NlcnJvcjxicj4NCiZndDvCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZXhpdMKgwqDCoCBoeXA9MCwg
Y29tcGF0PTE8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hl
bi9hcmNoL2FybS90cmFwcy5jPGJyPg0KJmd0OyBpbmRleCA1MWQyZTQyYzc3Li5jMThmODliNDFm
IDEwMDY0NDxicj4NCiZndDsgLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmM8YnI+DQomZ3Q7ICsr
KyBiL3hlbi9hcmNoL2FybS90cmFwcy5jPGJyPg0KJmd0OyBAQCAtMjAzOSw2ICsyMDM5LDggQEAg
c3RhdGljIHZvaWQgZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpy
ZWdzKTxicj4NCiZndDvCoCDCoMKgwqDCoMKgIHs8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyArwqDCoMKg
wqDCoMKgwqAgQVNTRVJUKCFsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7wqAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIElmIHRoZSBndWVzdCBoYXMgZGlzYWJsZWQg
dGhlIHdvcmthcm91bmQsIGJyaW5nIGl0IGJhY2sgb24uICovPGJyPg0KJmd0O8KgIMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoIG5lZWRzX3NzYmRfZmxpcCh2KSApPGJyPg0KJmd0O8KgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFybV9zbWNjY18xXzFfc21jKEFSTV9TTUNDQ19BUkNIX1dPUktB
Uk9VTkRfMl9GSUQsIDEsIE5VTEwpOzxicj4NCiZndDsgQEAgLTIwNzMsNiArMjA3NSw3IEBAIHZv
aWQgZG9fdHJhcF9ndWVzdF9zeW5jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTxicj4NCiZn
dDvCoCDCoMKgwqDCoMKgIGNvbnN0IHVuaW9uIGhzciBoc3IgPSB7IC5iaXRzID0gcmVncy0mZ3Q7
aHNyIH07PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoMKgwqDCoMKgIGVudGVyX2h5cGVydmlzb3Jf
aGVhZChyZWdzKTs8YnI+DQomZ3Q7ICvCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOzxicj4NCiZn
dDs8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoCBzd2l0Y2ggKCA8YSBocmVmPSJodHRwOi8vaHNyLmVj
IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5oc3IuZWM8L2E+ICk8YnI+DQomZ3Q7
wqAgwqDCoMKgwqDCoCB7PGJyPg0KJmd0OyBAQCAtMjIwOCw2ICsyMjExLDcgQEAgdm9pZCBkb190
cmFwX2h5cF9zeW5jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTxicj4NCiZndDvCoCDCoMKg
wqDCoMKgIGNvbnN0IHVuaW9uIGhzciBoc3IgPSB7IC5iaXRzID0gcmVncy0mZ3Q7aHNyIH07PGJy
Pg0KJmd0Ozxicj4NCiZndDvCoCDCoMKgwqDCoMKgIGVudGVyX2h5cGVydmlzb3JfaGVhZChyZWdz
KTs8YnI+DQomZ3Q7ICvCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOzxicj4NCiZndDs8YnI+DQom
Z3Q7wqAgwqDCoMKgwqDCoCBzd2l0Y2ggKCA8YSBocmVmPSJodHRwOi8vaHNyLmVjIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5oc3IuZWM8L2E+ICk8YnI+DQomZ3Q7wqAgwqDCoMKg
wqDCoCB7PGJyPg0KJmd0OyBAQCAtMjI0Niw2ICsyMjUwLDcgQEAgdm9pZCBkb190cmFwX2h5cF9z
eW5jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTxicj4NCiZndDvCoCDCoCB2b2lkIGRvX3Ry
YXBfaHlwX3NlcnJvcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk8YnI+DQomZ3Q7wqAgwqAg
ezxicj4NCiZndDvCoCDCoMKgwqDCoMKgIGVudGVyX2h5cGVydmlzb3JfaGVhZChyZWdzKTs8YnI+
DQomZ3Q7ICvCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOzxicj4NCiZndDs8YnI+DQomZ3Q7wqAg
wqDCoMKgwqDCoCBfX2RvX3RyYXBfc2Vycm9yKHJlZ3MsIFZBQk9SVF9HRU5fQllfR1VFU1QocmVn
cykpOzxicj4NCiZndDvCoCDCoCB9PGJyPg0KJmd0OyBAQCAtMjI1Myw2ICsyMjU4LDcgQEAgdm9p
ZCBkb190cmFwX2h5cF9zZXJyb3Ioc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpPGJyPg0KJmd0
O8KgIMKgIHZvaWQgZG9fdHJhcF9ndWVzdF9zZXJyb3Ioc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpPGJyPg0KJmd0O8KgIMKgIHs8YnI+DQomZ3Q7wqAgwqDCoMKgwqDCoCBlbnRlcl9oeXBlcnZp
c29yX2hlYWQocmVncyk7PGJyPg0KJmd0OyArwqDCoMKgIGxvY2FsX2lycV9lbmFibGUoKTs8YnI+
DQomZ3Q7PGJyPg0KJmd0O8KgIMKgwqDCoMKgwqAgX19kb190cmFwX3NlcnJvcihyZWdzLCB0cnVl
KTs8YnI+DQomZ3Q7wqAgwqAgfTxicj4NCiZndDs8YnI+DQotLSA8YnI+DQpTaW5jZXJlbHksPGJy
Pg0KQW5kcmlpIEFuaXNvdi48YnI+DQo8YnI+DQo8YnI+DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXzxicj4NClhlbi1kZXZlbCBtYWlsaW5nIGxpc3Q8YnI+
DQo8YSBocmVmPSJtYWlsdG86WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIiB0YXJnZXQ9
Il9ibGFuayI+WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPC9hPjxicj4NCjxhIGhyZWY9
Imh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw8L2E+PC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000054956057b073507--


--===============7500084602408146599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7500084602408146599==--
