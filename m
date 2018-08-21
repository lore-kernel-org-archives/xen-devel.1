From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Tue, 21 Aug 2018 09:54:36 -0600
Message-ID: <5B7C35BC02000078001E0981@prv1-mh.provo.novell.com>
References: <5B7BED1B02000078001E063C@suse.com>
 <eea4129d-f92d-166e-0bb5-4b8b8b966529@suse.com>
 <5B7C084A02000078001E07CD@suse.com>
 <c0e95b10-fae1-321f-cd3c-e9888962edef@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs8zR-0007YQ-S8
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:54:41 +0000
In-Reply-To: <c0e95b10-fae1-321f-cd3c-e9888962edef@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDE1OjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
MS8wOC8xOCAxNDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIxLjA4LjE4IGF0IDE0
OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDIxLzA4LzE4IDEyOjQ0LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+PiBAQCAtMjE5LDE3ICsyMTYsMTMgQEAgc3RhdGljIGludCBfX2lu
aXQgcGFyc2Vfc3BlY19jdHJsKGNvbnN0Cj4+Pj4gIH0KPj4+PiAgY3VzdG9tX3BhcmFtKCJzcGVj
LWN0cmwiLCBwYXJzZV9zcGVjX2N0cmwpOwo+Pj4+ICAKPj4+PiAtaW50OF90IF9fcmVhZF9tb3N0
bHkgb3B0X3B2X2wxdGYgPSAtMTsKPj4+PiArdWludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9wdl9s
MXRmID0gT1BUX1BWX0wxVEZfRE9NVV9ERUZBVUxUOwo+Pj4+ICAKPj4+PiAgc3RhdGljIF9faW5p
dCBpbnQgcGFyc2VfcHZfbDF0Zihjb25zdCBjaGFyICpzKQo+Pj4+ICB7Cj4+Pj4gICAgICBjb25z
dCBjaGFyICpzczsKPj4+PiAgICAgIGludCB2YWwsIHJjID0gMDsKPj4+PiAgCj4+Pj4gLSAgICAv
KiBJbmhpYml0IHRoZSBkZWZhdWx0cyBhcyBhbiBleHBsaWNpdCBjaG9pY2UgaGFzIGJlZW4gZ2l2
ZW4uICovCj4+Pj4gLSAgICBpZiAoIG9wdF9wdl9sMXRmID09IC0xICkKPj4+PiAtICAgICAgICBv
cHRfcHZfbDF0ZiA9IDA7Cj4+Pgo+Pj4gV291bGRuJ3Qgc2V0dGluZyB0aGUgZGVmYXVsdCB2YWx1
ZSAoRE9NVSkgaGVyZSBiZSBlbm91Z2g/IFNhbWUgZm9yCj4+PiB4cHRpIGJlbG93Pwo+PiAKPj4g
Tm8sIGJlY2F1c2Ugd2Ugd2FudCB0byBkZWZlciBkZWZhdWx0IHByb2Nlc3NpbmcgdW50aWwgd2Un
dmUKPj4gYWN0dWFsbHkgb2J0YWluZWQgdGhlIG5lY2Vzc2FyeSBkYXRhLiBXaGlsZSBwYXJzaW5n
IHdlIGRvbid0Cj4+IGtub3cgeWV0IHdoZXRoZXIgImRlZmF1bHQiIG1lYW5zICJvbiIgb3IgIm9m
ZiIuCj4+IAo+PiBPciBwZXJoYXBzIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuPwo+
IAo+IEkgbWVhbnQ6Cj4gCj4gICAgICBpZiAoIG9wdF9wdl9sMXRmID09IC0xICkKPiAtICAgICAg
ICBvcHRfcHZfbDF0ZiA9IDA7Cj4gKyAgICAgICAgb3B0X3B2X2wxdGYgPSBPUFRfUFZfTDFURl9E
T01VOwo+IAo+IFRoaXMgc3RhcnRzIGF0IHRoZSBkZWZhdWx0IHNldHRpbmcgYW5kIHRoZW4gYXBw
bGllcyB0aGUgc2V0dGluZ3Mgb2YgdGhlCj4gc3ViLW9wdGlvbnMgb24gdG9wIG9mIGl0LCBpbnN0
ZWFkIG9mIHN0YXJ0aW5nIGF0ICJldmVyeXRoaW5nIG9mZiIuCgpXZWxsLCBhcyBzYWlkIC0gdGhp
cyB3b3VsZCBnZXQgaW4gdGhlIHdheSBvZgoKICAgIGlmICggKG9wdF9wdl9sMXRmICYgT1BUX1BW
X0wxVEZfRE9NVV9ERUZBVUxUKSAmJgogICAgICAgICAhcHZfc2hpbSAmJiBjcHVfaGFzX2J1Z19s
MXRmICkKICAgICAgICBvcHRfcHZfbDF0ZiB8PSBPUFRfUFZfTDFURl9ET01VOwoKY2xvc2UgdG8g
dGhlIGVuZCBvZiB0aGUgcGF0Y2guIElPVyAicHYtbDF0Zj1kb20wIiBhcyB3ZWxsCmFzICJwdi1s
MXRmPW5vLWRvbTAiIG91Z2h0IHRvIGxlYXZlIERvbVUtcyBydW5uaW5nCndpdGhvdXQgdGhlIHdv
cmthcm91bmQgb24gZml4ZWQgaGFyZHdhcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
