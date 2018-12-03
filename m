From: "msd+xen-devel@msd.im" <msd+xen-devel@msd.im>
Subject: Re: [Xen EFI] Impossible to limit the dom0 memory
Date: Mon, 3 Dec 2018 10:08:05 +0100
Message-ID: <d580fc4b-2855-9e50-724a-e0eaed1f5d5b@msd.im>
References: <54c84622-01da-6cbd-1c3e-3cbbb66ad44d@msd.im>
 <5A67493902000078001A1924@prv-mh.provo.novell.com>
 <5fe79d73-8b29-5ad6-831d-a509bccf6970@msd.im>
 <5A68472302000078001A1C8C@prv-mh.provo.novell.com>
 <864eea58-74a5-f005-60a4-5549805df3eb@msd.im>
 <5A69C21602000078001A24A3@prv-mh.provo.novell.com>
 <0f6fc9a5-4bbf-3ad8-6f87-99723b445246@suse.com>
 <9a190da7-a95c-11df-ef13-76f3f63eaf7d@msd.im>
 <d023af0b-7cd6-546f-e264-fd732574317b@suse.com>
 <405b5fc0-2c40-b426-2f21-3cd1d40b8c7b@msd.im>
 <de078e72-9509-f447-c59e-649d63d536a3@msd.im>
 <5C04E87602000078002020F3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IbeX=OM=msd.im=msd+xen-devel@srs-us1.protection.inumbo.net>)
 id 1gTkD6-0005m0-5k
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 09:08:12 +0000
In-Reply-To: <5C04E87602000078002020F3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLCBoaSBKdWVyZ2VuLAoKPiBUaGlzIG5lZWRzIHRvIGJlIGludmVzdGlnYXRlZCBmcm9t
IHRoZSBrZXJuZWwgc2lkZQo+ICh3aGljaCBJJ20gYWZyYWlkIEkgc2ltcGx5IGRvbid0IGhhdmUg
dGhlIHRpbWUgdG8gaGVscCB3aXRoKS4KCklmIHNvbWVvbmUgY2FuIGxlYWQgbWUsIEkgY2FuIGdp
dmUgc29tZSBvZiBteSB0aW1lIHRvIGhlbHAuCgpJIGNhbiBhbHNvIHByb3ZpZGUgYW4gYWNjZXNz
IHRvIGEgc2VydmVyIHdoZXJlIHRoZSBwcm9ibGVtIG9jY3Vycy4KCkxldCBtZSBrbm93IHdoYXQg
SSBjYW4gZG8uCgo+IEkgYWxzbyBoYXZlIHRvIGFkbWl0IHRoYXQgeW91ciB3YXkgb2Ygc3RyaXBw
aW5nIGFsbCByZWxldmFudAo+ICh0ZWNobmljYWwpIGNvbnRleHQgZnJvbSB0aGUgZWFybGllciBj
b252ZXJzYXRpb24gbWFkZSBpdAo+IG5lY2Vzc2FyeSB0byBkaWcgb3V0IHRoZSBvbGQgdGhyZWFk
IHRvIHVuZGVyc3RhbmQgYXQgYWxsIHdoYXQKPiB0aGlzIGlzIGFib3V0LgoKU29ycnksIGZvciBl
dmVyeW9uZSBlbHNlIGludGVyZXN0ZWQgYnkgdGhlIHByb2JsZW0sIHRoZSB0aHJlYWQgaXMgaGVy
ZSA6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTgtMDEvdGhyZWFkcy5odG1sIzAyMDEwCgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LAoKCkd1
aWxsYXVtZQoKTGUgMDMvMTIvMjAxOCDDoCAwOToyNSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoK
Pj4+PiBPbiAzMC4xMS4xOCBhdCAxNjoxMiwgPG1zZCt4ZW4tZGV2ZWxAbXNkLmltPiB3cm90ZToK
Pj4gSSdtIHRyeWluZyBhZ2FpbiB0aGlzIHdlZWsgdG8gaW5zdGFsbCBYZW4gb24gYSBPVkggc2Vy
dmVyCj4+IChodHRwczovL3d3dy5vdmguY29tL2ZyL3NlcnZldXJzX2RlZGllcy9pbmZyYS8xODAx
ZWcwMi54bWwpLgo+Pgo+PiBJdCBpcyBzdGlsbCBpbXBvc3NpYmxlIHRvIGJvb3QgWGVuIHdpdGgg
dGhlIG9wdGlvbiAiZG9tMF9tZW09MUcsbWF4OjFHIgo+PiAoYm9vdCA6IEVGSS0+eGVuKS4KPiAK
PiBJJ20gc29ycnkgdG8gc2F5IHNvLCBidXQgbm90aGluZyBoYXMgY2hhbmdlZCBmcm9tIHRoZSBw
cmlvcgo+IHNpdHVhdGlvbjogVGhpcyBuZWVkcyB0byBiZSBpbnZlc3RpZ2F0ZWQgZnJvbSB0aGUg
a2VybmVsIHNpZGUKPiAod2hpY2ggSSdtIGFmcmFpZCBJIHNpbXBseSBkb24ndCBoYXZlIHRoZSB0
aW1lIHRvIGhlbHAgd2l0aCkuCj4gSSBhbHNvIGhhdmUgdG8gYWRtaXQgdGhhdCB5b3VyIHdheSBv
ZiBzdHJpcHBpbmcgYWxsIHJlbGV2YW50Cj4gKHRlY2huaWNhbCkgY29udGV4dCBmcm9tIHRoZSBl
YXJsaWVyIGNvbnZlcnNhdGlvbiBtYWRlIGl0Cj4gbmVjZXNzYXJ5IHRvIGRpZyBvdXQgdGhlIG9s
ZCB0aHJlYWQgdG8gdW5kZXJzdGFuZCBhdCBhbGwgd2hhdAo+IHRoaXMgaXMgYWJvdXQuCj4gCj4g
SmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
