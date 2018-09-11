From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH] traps: coding style fixes
Date: Tue, 11 Sep 2018 14:22:56 +0300
Message-ID: <a3ff531e-4e7f-a4b7-dbe6-94b562253749@epam.com>
References: <1536650302-3013-1-git-send-email-andrii.anisov@gmail.com>
 <5B977B9A02000078001E7097@prv1-mh.provo.novell.com>
 <dc2913f3-623d-3b84-58e6-66011f328334@epam.com>
 <f9064d01-34a6-4945-8886-74e6458c2340@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7wzx=lz=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1fzglB-0003Jm-4C
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 11:23:09 +0000
In-Reply-To: <f9064d01-34a6-4945-8886-74e6458c2340@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, andrii.anisov@gmail.com
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKSGVsbG8gSnVsaWVuLAoKT24gMTEuMDkuMTggMTM6NDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPiBXaGF0J3MgeW91ciBmdWxsIGNvbW1hbmQ/IApGb3IgdGhpcyBwYXJ0aWN1
bGFyIHBhdGNoIGl0IHdhczoKIMKgwqDCoCBnaXQgZm9ybWF0LXBhdGNoIC0xIC0tdG8gInhlbi1k
ZXZlbEBsaXN0cy54ZW4ub3JnIgogwqDCoMKgIGdpdCBzZW5kLWVtYWlsIC0tY2MtY21kPXNjcmlw
dHMvZ2V0X21haW50YWluZXIucGwgCjAwMDEtdHJhcHMtY29kaW5nLXN0eWxlLWZpeGVzLnBhdGNo
Cgo+IEFsbCBvY2N1cnJlbmNlIG9mIHhlbi5vcmcgaGFzIGJlZW4gcmVtb3ZlZCBhIHdoaWxlIGFn
by4uLiBTbyBpdCBzaG91bGQgCj4gbm90IGhhcHBlbiB1bmxlc3MgeW91IHVzZSBhbiBvbGQgdHJl
ZS4KQW5kIHdhcyBkb25lIG9uIHRvcCBvZiB0aGUgY3VycmVudCBtYXN0ZXI6CgogICAgYWFuaXNv
dkBhYW5pc292LXdvcms6fi9ERVYvdGVtcC94ZW4kIGdpdCBzaG93IC0tb25lbGluZSAtLWRlY29y
YXRlCiAgICAxZDA2OWU0IChIRUFELCBvcmlnaW4vc3RhZ2luZywgb3JpZ2luL3Ntb2tlLCBvcmln
aW4vbWFzdGVyLAogICAgb3JpZ2luL2NvdmVyaXR5LXRlc3RlZC9zbW9rZSwgb3JpZ2luL0hFQUQp
IG1rZGViOiB1c2UgY29tcHJlc3Npb24KICAgIGxldmVsIDAKICAgIGRpZmYgLS1naXQgYS90b29s
cy9taXNjL21rZGViIGIvdG9vbHMvbWlzYy9ta2RlYgogICAgaW5kZXggNjdiOTFjYy4uZjRiZWZj
YyAxMDA2NDQKICAgIC0tLSBhL3Rvb2xzL21pc2MvbWtkZWIKICAgICsrKyBiL3Rvb2xzL21pc2Mv
bWtkZWIKICAgIEBAIC01OSw3ICs1OSw3IEBAIGZpbmQgZGViL2V0YyAtdHlwZSBmIC1wcmludGYg
L2V0Yy8lUFxcbgogICAgID5kZWIvREVCSUFOL2NvbmZmaWxlcwoKICAgICDCoCMgUGFja2FnZSBp
dCB1cAogICAgIMKgY2hvd24gLVIgcm9vdDpyb290IGRlYgogICAgLWRwa2cgLS1idWlsZCBkZWIg
eGVuLXVwc3RyZWFtLSR2ZXJzaW9uLmRlYgogICAgK2Rwa2ctZGViIC0tYnVpbGQgLXowIGRlYiB4
ZW4tdXBzdHJlYW0tJHZlcnNpb24uZGViCgogICAgIMKgIyBUaWR5IHVwIGFmdGVyIG91cnNlbHZl
cwogICAgIMKgcm0gLXJmIGRlYgogICAgYWFuaXNvdkBhYW5pc292LXdvcms6fi9ERVYvdGVtcC94
ZW4kIGdyZXAgLWkgInhlbi1kZXZlbCIgTUFJTlRBSU5FUlMKICAgIEJhY2twb3J0IHJlcXVlc3Rz
IHNob3VsZCBiZSBtYWRlIG9uIHRoZSB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKICAg
IEw6wqDCoMKgIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwogICAgTDrCoMKgwqAgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCiAgICBMOsKgwqDCoCB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKICAgIEw6wqDCoMKgIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwoKLS0gCgoqQW5kcmlpIEFuaXNvdioKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
