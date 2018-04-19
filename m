From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 16/16] configure: do_compiler: Dump some extra
 info under bash
Date: Thu, 19 Apr 2018 17:45:19 +0100
Message-ID: <1524156319-11465-17-git-send-email-ian.jackson@eu.citrix.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxfj=hi=citrix.com=prvs=6403088e3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9Ch0-0004H2-RQ
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:45:54 +0000
In-Reply-To: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Janosch Frank <frankja@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Kent R. Spillner" <kspillner@acm.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtYWtlcyBpdCBtdWNoIGVhc2llciB0byBmaW5kIGEgcGFydGljdWxhciB0aGluZyBpbiBj
b25maWcubG9nLgoKVGhlIGluZm9ybWF0aW9uIG1heSBiZSBsYWNraW5nIGluIG90aGVyIHNoZWxs
cywgcmVzdWx0aW5nIGluIGhhcm1sZXNzCmVtcHR5IG91dHB1dC4gIChUaGlzIGlzIHdoeSB3ZSBk
b24ndCB1c2UgdGhlIHByb3BlciAke0ZVTkNOQU1FWypdfQphcnJheSBzeW50YXggLSBvdGhlciBz
aGVsbHMgd2lsbCBjaG9rZSBvbiB0aGF0LikKClRoZSBleHRyYSBvdXRwdXQgaXMgb25seSBwcmlu
dGVkIGlmIGNvbmZpZ3VyZSBpcyBydW4gd2l0aCBiYXNoLiAgT24Kc3lzdGVtcyB3aGVyZSAvYmlu
L3NoIGlzIG5vdCBiYXNoLCBpdCBpcyBuZWNlc3NhcnkgdG8gc2F5IGJhc2gKLi9jb25maWd1cmUg
dG8gZ2V0IHRoZSBleHRyYSBkZWJ1ZyBpbmZvIGluIHRoZSBsb2cuCgpTaWduZWQtb2ZmLWJ5OiBJ
YW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IEtlbnQgUi4gU3BpbGxu
ZXIgPGtzcGlsbG5lckBhY20ub3JnPgpDQzogSmFub3NjaCBGcmFuayA8ZnJhbmtqYUBsaW51eC52
bmV0LmlibS5jb20+CkNDOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KQ0M6IFBldGVy
IE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KQ0M6IFBhb2xvIEJvbnppbmkgPHBi
b256aW5pQHJlZGhhdC5jb20+Ci0tLQp2NjogRml4IGNvbW1pdCBtZXNzYWdlIHdvcmRpbmcuCnY0
OiBObyBsb25nZXIgdGFnIHRoaXMgcGF0Y2ggUkZDLgotLS0KIGNvbmZpZ3VyZSB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBi
L2NvbmZpZ3VyZQppbmRleCBkNTQzNWZmLi5hNGM1MjkyIDEwMDc1NQotLS0gYS9jb25maWd1cmUK
KysrIGIvY29uZmlndXJlCkBAIC02MCw2ICs2MCwxMCBAQCBkb19jb21waWxlcigpIHsKICAgICAj
IGlzIGNvbXBpbGVyIGJpbmFyeSB0byBleGVjdXRlLgogICAgIGxvY2FsIGNvbXBpbGVyPSIkMSIK
ICAgICBzaGlmdAorICAgIGVjaG8gPj5jb25maWcubG9nICIKK2Z1bmNzOiAke0ZVTkNOQU1FfQor
bGluZXM6ICR7QkFTSF9MSU5FTk99CitmaWxlczogJHtCQVNIX1NPVVJDRX0iCiAgICAgZWNobyAk
Y29tcGlsZXIgIiRAIiA+PiBjb25maWcubG9nCiAgICAgJGNvbXBpbGVyICIkQCIgPj4gY29uZmln
LmxvZyAyPiYxIHx8IHJldHVybiAkPwogICAgICMgVGVzdCBwYXNzZWQuIElmIHRoaXMgaXMgYW4g
LS1lbmFibGUtd2Vycm9yIGJ1aWxkLCByZXJ1bgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
