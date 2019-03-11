From: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Subject: Re: [PATCH v2] makedumpfile: exclude pages that are
 logically offline
Date: Mon, 11 Mar 2019 16:40:30 +0000
Message-ID: <4AE2DC15AC0B8543882A74EA0D43DBEC03569C9C__42245.4431116179$1552322568$gmane$org@BPXM09GP.gisp.nec.co.jp>
References: <20181122100627.5189-1-david@redhat.com>
 <20181122100938.5567-1-david@redhat.com>
 <4AE2DC15AC0B8543882A74EA0D43DBEC03561800@BPXM09GP.gisp.nec.co.jp>
 <7c9d6d5c-d6cf-00a7-7f23-bf28cbb382af@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhEb=RO=ab.jp.nec.com=k-hagio@srs-us1.protection.inumbo.net>)
 id 1h3Nzx-0000ld-2U
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:41:57 +0000
In-Reply-To: <7c9d6d5c-d6cf-00a7-7f23-bf28cbb382af@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pv-drivers@vmware.com" <pv-drivers@vmware.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, kexec-ml <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>
List-Id: xen-devel@lists.xenproject.org

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gT24gMjcuMTEuMTggMTc6MzIsIEthenVoaXRv
IEhhZ2lvIHdyb3RlOg0KPiA+PiBMaW51eCBtYXJrcyBwYWdlcyB0aGF0IGFyZSBsb2dpY2FsbHkg
b2ZmbGluZSB2aWEgYSBwYWdlIGZsYWcgKG1hcCBjb3VudCkuDQo+ID4+IFN1Y2ggcGFnZXMgZS5n
LiBpbmNsdWRlIHBhZ2VzIGluZmF0ZWQgYXMgcGFydCBvZiBhIGJhbGxvb24gZHJpdmVyIG9yDQo+
ID4+IHBhZ2VzIHRoYXQgd2VyZSBub3QgYWN0dWFsbHkgb25saW5lZCB3aGVuIG9ubGluaW5nIHRo
ZSB3aG9sZSBzZWN0aW9uLg0KPiA+Pg0KPiA+PiBXaGlsZSB0aGUgaHlwZXJ2aXNvciB1c3VhbGx5
IGFsbG93cyB0byByZWFkIHN1Y2ggaW5mbGF0ZWQgbWVtb3J5LCB3ZQ0KPiA+PiBiYXNpY2FsbHkg
cmVhZCBhbmQgZHVtcCBkYXRhIHRoYXQgaXMgY29tcGxldGVseSBpcnJlbGV2YW50LiBBbHNvLCB0
aGlzDQo+ID4+IG1pZ2h0IHJlc3VsdCBpbiBxdWl0ZSBzb21lIG92ZXJoZWFkIGluIHRoZSBoeXBl
cnZpc29yLiBJbiBhZGRpdGlvbiwNCj4gPj4gd2Ugc2F3IHNvbWUgcHJvYmxlbXMgdW5kZXIgSHlw
ZXItViwgd2hlcmVieSB3ZSBjYW4gY3Jhc2ggdGhlIGtlcm5lbCBieQ0KPiA+PiBkdW1waW5nLCB3
aGVuIHJlYWRpbmcgbWVtb3J5IG9mIGEgcGFydGlhbGx5IG9ubGluZWQgbWVtb3J5IHNlZ21lbnQN
Cj4gPj4gKGZvciBtZW1vcnkgYWRkZWQgYnkgdGhlIEh5cGVyLVYgYmFsbG9vbiBkcml2ZXIpLg0K
PiA+Pg0KPiA+PiBUaGVyZWZvcmUsIGRvbid0IHJlYWQgYW5kIGR1bXAgcGFnZXMgdGhhdCBhcmUg
bWFya2VkIGFzIGJlaW5nIGxvZ2ljYWxseQ0KPiA+PiBvZmZsaW5lLg0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gPg0KPiA+
IFRoYW5rcyBmb3IgdGhlIHYyIHVwZGF0ZS4NCj4gPiBJJ20gZ29pbmcgdG8gbWVyZ2UgdGhpcyBw
YXRjaCBhZnRlciB0aGUga2VybmVsIHBhdGNoZXMgYXJlIG1lcmdlZA0KPiA+IGFuZCBpdCB0ZXN0
cyBmaW5lIHdpdGggdGhlIGtlcm5lbC4NCj4gPg0KPiA+IEthenUNCj4gDQo+IEhpIEthenUsDQo+
IA0KPiB0aGUgcGF0Y2hlcyBhcmUgbm93IHVwc3RyZWFtLiBUaGFua3MhDQoNClRlc3RlZCBPSyBh
dCBteSBlbmQsIHRvby4gQXBwbGllZCB0byB0aGUgZGV2ZWwgYnJhbmNoLg0KDQogICAgT2ZmbGlu
ZSBwYWdlcyAgICAgICAgICAgOiAweDAwMDAwMDAwMDAwMDI0MDANCg0KVGhhbmsgeW91IQ0KS2F6
dQ0KDQo+IA0KPiAtLQ0KPiANCj4gVGhhbmtzLA0KPiANCj4gRGF2aWQgLyBkaGlsZGVuYg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
