From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v3 13/17] x86/xen: enable Hygon support to
 Xen
Date: Thu, 16 Aug 2018 21:29:13 +0800
Message-ID: <16c21c53-2a03-d5fe-9232-8c0e377566a7__5962.88190358809$1534426093$gmane$org@hygon.cn>
References: <cover.1533989492.git.puwen@hygon.cn>
 <2747ad959f07459000f2693a98d237e2b3149ca1.1533989493.git.puwen@hygon.cn>
 <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
 <0aa44410-47ec-27e2-10d9-c0dc5d2e457a@suse.com>
 <150f6a8d-33e8-a84d-f34b-17bdb7264ebe@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zt+t=k7=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1fqIL5-0005aF-3I
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 13:29:23 +0000
In-Reply-To: <150f6a8d-33e8-a84d-f34b-17bdb7264ebe@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, thomas.lendacky@amd.com, bp@alien8.de, pbonzini@redhat.com, JBeulich@suse.com
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC84LzEyIDIxOjI2LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gMDgvMTIvMjAx
OCAwNDo1NSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTEvMDgvMTggMTY6MzQsIEJv
cmlzIE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDA4LzExLzIwMTggMDk6MjkgQU0sIFB1IFdlbiB3
cm90ZToKPj4+PiAgIGJvb2wgcG11X21zcl9yZWFkKHVuc2lnbmVkIGludCBtc3IsIHVpbnQ2NF90
ICp2YWwsIGludCAqZXJyKQo+Pj4+ICAgewo+Pj4+IC0JaWYgKGJvb3RfY3B1X2RhdGEueDg2X3Zl
bmRvciA9PSBYODZfVkVORE9SX0FNRCkgewo+Pj4+ICsJaWYgKGJvb3RfY3B1X2RhdGEueDg2X3Zl
bmRvciA9PSBYODZfVkVORE9SX0FNRCB8fAo+Pj4+ICsJICAgIGJvb3RfY3B1X2RhdGEueDg2X3Zl
bmRvciA9PSBYODZfVkVORE9SX0hZR09OKSB7Cj4+Pgo+Pj4gJ2lmIChib290X2NwdV9kYXRhLng4
Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCknIHBsZWFzZS4KPj4gUmVhbGx5PyBYZW4gc3Vw
cG9ydHMgQ2VudGF1ciwgdG9vLgo+IAo+IFZQTVUgZG9lc24ndCAtLS0gaHlwZXJ2aXNvciB3aWxs
IG5vdCBpbml0aWFsaXplIGl0LiBCZXNpZGVzLCB0aGUKPiBleGlzdGluZyBjb2RlIHdpbGwgc3Rl
ZXIgbm9uLUFNRCBleGVjdXRpb24gdG8gSW50ZWwsIHdoaWNoIGlzIG5vdCByaWdodAo+IGVpdGhl
ci4KPiAKPiBJJ2xsIGFkZCBhIGNoZWNrIHRvIGJhaWwgaWYgVlBNVSBpcyBub3QgaW5pdGlhbGl6
ZWQgcHJvcGVybHksIHdlIHNlZW0gdG8KPiBpZ25vcmUgeGVuX3BtdV9pbml0KCkgZmFpbHVyZXMu
IFdoaWNoLCBCVFcsIG1ha2VzIHRoaXMgcGF0Y2ggcmF0aGVyCj4gcG9pbnRsZXNzIHVudGlsIHRo
ZXJlIGlzIHN1cHBvcnQgZm9yIEh5Z29uIFhlbi4KClNvIHNob3VsZCBpdCBzdGlsbCBuZWVkIHRv
IHRlc3QgdmVuZG9yIEh5Z29uIGhlcmUgb3Igd2FpdCBmb3IgeW91ciBjaGVjawpkb25lPwoKVGhh
bmtzLApQdSBXZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
