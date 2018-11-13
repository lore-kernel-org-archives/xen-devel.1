From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 5/3] x86/shadow: emulate_gva_to_mfn() should
 respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 10:59:20 +0000
Message-ID: <dc11f02ac58c4834899caa1faca021e6@AMSPEX02CL03.citrite.net>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BEAABA302000078001FB62E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=89dt=ny=citrix.com=prvs=84824ace7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gMWPk-0006hR-1a
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:59:24 +0000
In-Reply-To: <5BEAABA302000078001FB62E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgTm92ZW1iZXIgMjAxOCAxMDo0Nwo+IFRvOiB4
ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBDYzogQW5kcmV3IENv
b3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBUaW0gKFhl
bi5vcmcpCj4gPHRpbUB4ZW4ub3JnPgo+IFN1YmplY3Q6IFtQQVRDSCA1LzNdIHg4Ni9zaGFkb3c6
IGVtdWxhdGVfZ3ZhX3RvX21mbigpIHNob3VsZCByZXNwZWN0Cj4gcDJtX2lvcmVxX3NlcnZlcgo+
IAo+IFdyaXRlcyB0byBzdWNoIHBhZ2VzIHdvdWxkIG5lZWQgdG8gYmUgaGFuZGVkIHRvIHRoZSBl
bXVsYXRvciwgd2hpY2ggd2UncmUKPiBub3QgcHJlcGFyZWQgdG8gZG8gYXQgdGhpcyBwb2ludC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvaHZtLmMKPiBAQCAtMzM4LDcgKzMzOCw3IEBAIHN0YXRpYyBtZm5fdCBlbXVsYXRl
X2d2YV90b19tZm4oc3RydWN0IHYKPiAgICAgIHsKPiAgICAgICAgICByZXR1cm4gX21mbihCQURf
R0ZOX1RPX01GTik7Cj4gICAgICB9Cj4gLSAgICBpZiAoIHAybV9pc19kaXNjYXJkX3dyaXRlKHAy
bXQpICkKPiArICAgIGlmICggcDJtX2lzX2Rpc2NhcmRfd3JpdGUocDJtdCkgfHwgcDJtdCA9PSBw
Mm1faW9yZXFfc2VydmVyICkKPiAgICAgIHsKPiAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiAg
ICAgICAgICByZXR1cm4gX21mbihSRUFET05MWV9HRk4pOwoKSXMgdGhpcyB3aGF0IHdlIHdhbnQg
aGVyZT8gSSB3b3VsZCBoYXZlIHRob3VnaHQgd2Ugd2FudCB0byByZXR1cm4gQkFEX0dGTl9UT19N
Rk4gaW4gdGhlIHAybV9pb3JlcV9zZXJ2ZXIgY2FzZSBzbyB0aGF0IHRoZSBjYWxsZXIgdHJlYXRz
IHRoaXMgaW4gdGhlIHNhbWUgd2F5IGl0IHdvdWxkIE1NSU8uCgogIFBhdWwKCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
