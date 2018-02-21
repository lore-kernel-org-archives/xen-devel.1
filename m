From: Andres Lagar Cavilla <andres@lagarcavilla.org>
Subject: AD bits in traditional PV mode
Date: Tue, 20 Feb 2018 16:42:58 -0800
Message-ID: <CADzFZPuuhrMQa2zCrYimeLghVc2re_3KoB8R0szfV-H1bK=cuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3690244043593587025=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============3690244043593587025==
Content-Type: multipart/alternative; boundary="001a11410ba473daa40565ae3596"

--001a11410ba473daa40565ae3596
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I was thinking of the traditional Xen PV mode in which page table pages are
write protected from guest meddling and PTE modifications are audited by
the hypervisor (ptwr_emulated_update() these days, still?).

Without software shadows or paging to e.g. an EPT, native PV loads the
actual CR3 pointing to a write protected page table tree. When the cr3 is
loaded, the hardware walker will want to set A and D bits in PTEs -- is
this action immune to the write protection in the page table pages
themselves? Or do we take emulation faults on these updates as well?

Thanks
Andres

--001a11410ba473daa40565ae3596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello everyone,<div><br><div>I was thinking of the traditi=
onal Xen PV mode in which page table pages are write protected from guest m=
eddling and PTE modifications=C2=A0are audited by the hypervisor (ptwr_emul=
ated_update() these days, still?).</div><div><br></div><div>Without softwar=
e shadows or paging to e.g. an EPT, native PV loads the actual CR3 pointing=
 to a write protected page table tree. When the cr3 is loaded, the hardware=
 walker will want to set A and D bits in PTEs -- is this action immune to t=
he write protection in the page table pages themselves? Or do we take emula=
tion faults on these updates as well?</div><div><br></div><div>Thanks</div>=
</div><div>Andres</div></div>

--001a11410ba473daa40565ae3596--


--===============3690244043593587025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3690244043593587025==--
