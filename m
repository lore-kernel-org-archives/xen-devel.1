From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 08/18] xen: add basic hooks for PVH in
 current code
Date: Fri, 19 Oct 2018 16:33:27 +0100
Message-ID: <20181019153327.giznmhrlxxjjmjsb__44530.1994718195$1539963175$gmane$org@mac.bytemobile.com>
References: <20181009110317.6022-1-jgross@suse.com>
 <20181009110317.6022-9-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20181009110317.6022-9-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hans@knorrie.org, grub-devel@gnu.org, daniel.kiper@oracle.com, xen-devel@lists.xen.org, phcoder@gmail.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDksIDIwMTggYXQgMDE6MDM6MDdQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgdGhlIGhvb2tzIHRvIGN1cnJlbnQgY29kZSBuZWVkZWQgZm9yIFhlbiBQVkgu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IC0t
LQo+ICBncnViLWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYyAgICAgICAgIHwgMzYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZ3J1Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vc3Rh
cnR1cF9wdmguUyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZ3J1Yi1jb3Jl
L2tlcm4veGVuL2luaXQuYyAgICAgICAgICAgICB8ICA2ICsrKysrKwo+ICBpbmNsdWRlL2dydWIv
aTM4Ni94ZW5wdmgva2VybmVsLmggICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgaW5jbHVkZS9ncnViL3hlbi5oICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKysrKwo+
ICA1IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBncnViLWNvcmUva2Vybi9pMzg2L3hlbi9wdmguYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZ3J1
Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vc3RhcnR1cF9wdmguUwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9ncnViL2kzODYveGVucHZoL2tlcm5lbC5oCj4gCj4gZGlmZiAtLWdpdCBhL2dydWIt
Y29yZS9rZXJuL2kzODYveGVuL3B2aC5jIGIvZ3J1Yi1jb3JlL2tlcm4vaTM4Ni94ZW4vcHZoLmMK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uMTgyZWY5NWY5Cj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL2dydWItY29yZS9rZXJuL2kzODYveGVuL3B2aC5jCj4gQEAgLTAs
MCArMSwzNiBAQAo+ICsvKgo+ICsgKiAgR1JVQiAgLS0gIEdSYW5kIFVuaWZpZWQgQm9vdGxvYWRl
cgo+ICsgKiAgQ29weXJpZ2h0IChDKSAyMDExICBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIElu
Yy4KCklzbid0IHRoaXMgaGVhZGVyIChhbmQgdGhlIG9uZXMgYmVsb3cpIGtpbmQgb2Ygb2ZmIGF0
IGxlYXN0IHllYXIKd2lzZT8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
