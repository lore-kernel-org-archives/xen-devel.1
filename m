From: George Dunlap <dunlapg@umich.edu>
Subject: Re: Patches for stable
Date: Fri, 6 Apr 2018 10:49:14 +0100
Message-ID: <CAFLBxZY7W6i3RNq4Rc1fbVZjUB-ssXm9VtAyBESqVAFoGKUakA@mail.gmail.com>
References: <a38538ef-d766-adb9-77d7-4624cf1dd749@suse.com>
 <20180404142702.GA20460@kroah.com>
 <e17d3e80-b019-ac09-d796-771ed38d91e5@suse.com>
 <20180404144644.GA22656@kroah.com>
 <c03563a8-8291-38a2-7bdb-12d6894c8fbd@suse.com>
 <20180404154201.GA31981@kroah.com>
 <9cd0be43-6380-f5a0-0427-7f75fca966a9@suse.com>
 <20180405063314.GC5431@kroah.com>
 <e6fa2f5e-30c9-7aa2-5705-c890f7538b62@suse.com>
 <20180405071448.GA9183@kroah.com>
 <d1b13a66-f31a-558c-7935-340e71bfa9a9@suse.com>
 <CAFLBxZYpTSfkJ3KJg2-M5Pn5y_DiYzOaebCE8f3TkJD8XCOzrA@mail.gmail.com>
 <950f2f68-04ef-bf4d-fa61-afa9bdc918e4@suse.com>
 <ce82c767-cfb6-5bb7-1733-7b322a4360f2@oracle.com>
 <4bf257f2-dad7-62d2-ad5b-8972c0311119@suse.com>
 <CAFLBxZaAB8nEnYTtaG-qgps54ZZWxRL7ysTC7U7rA1fMKnjwdA@mail.gmail.com>
 <9fb78740-33a1-76f8-4a7d-e7713c3b8078@suse.com>
 <CAFLBxZaHR6dHgzULfKf9OPA9b9dtBy0DBEe5MTFhmMMw67A5Zw@mail.gmail.com>
 <2fc861a4-c4e8-0a3b-ef92-af5308ed2a87@suse.com>
 <1de5bc8e-4c63-f476-6a7b-aaa157487264@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jkht=g3=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1f4Nzh-0004Ij-5q
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 09:49:17 +0000
Received: by mail-qk0-x242.google.com with SMTP id v2so496991qkh.10
 for <xen-devel@lists.xenproject.org>; Fri, 06 Apr 2018 02:49:15 -0700 (PDT)
In-Reply-To: <1de5bc8e-4c63-f476-6a7b-aaa157487264@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgNSwgMjAxOCBhdCA3OjMzIFBNLCBCb3JpcyBPc3Ryb3Zza3kKPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPiBPbiAwNC8wNS8yMDE4IDAxOjExIFBNLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwNS8wNC8xOCAxNjo1NiwgR2VvcmdlIER1bmxhcCB3cm90
ZToKPj4+IE9uIFRodSwgQXByIDUsIDIwMTggYXQgMzowOSBQTSwgSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAwNS8wNC8xOCAxNTo0MiwgR2VvcmdlIER1bmxh
cCB3cm90ZToKPj4+Pj4gT24gVGh1LCBBcHIgNSwgMjAxOCBhdCAyOjA2IFBNLCBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gMDUvMDQvMTggMTU6MDAsIEJv
cmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Pj4+PiBPbiAwNC8wNS8yMDE4IDA4OjE5IEFNLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwNS8wNC8xOCAxMjowNiwgR2VvcmdlIER1bmxh
cCB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4+IEFyZW4ndCB0aGVyZSBmbGFncyBpbiB0aGUgYmlu
YXJ5IHNvbWV3aGVyZSB0aGF0IGNvdWxkIHRlbGwgdGhlCj4+Pj4+Pj4+PiB0b29sc3RhY2sgLyBY
ZW4gd2hldGhlciB0aGUga2VybmVsIGluIHF1ZXN0aW9uIG5lZWRzIHRoZSBSU0RQIHRhYmxlIGlu
Cj4+Pj4+Pj4+PiBsb3dtZW0sIG9yIHdoZXRoZXIgaXQgY2FuIGJlIHB1dCBoaWdoZXI/Cj4+Pj4+
Pj4+IE5vdCByZWFsbHkuIEFuYWx5emluZyB0aGUgYmluYXJ5IHdoZXRoZXIgaXQgYWNjZXNzZXMg
dGhlIHJzZHBfYWRkciBpbgo+Pj4+Pj4+PiB0aGUgc3RhcnRfaW5mbyBpc24ndCB0aGUgd2F5IHRv
IGdvLCBJTU8uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkndmUgc2VudCBhIHBhdGNoIHRvIHhlbi1kZXZl
bCBhZGRpbmcgYSBxdWlyayBmbGFnIHRvIHRoZSBkb21haW4ncwo+Pj4+Pj4+PiBjb25maWcgdG8g
ZW5hYmxlIHRoZSBhZG1pbiBzcGVjaWFsIGNhc2luZyBzdWNoIGFuICJvbGQiIGtlcm5lbC4KPj4+
Pj4+PiBDYW4gd2UgYmFja3BvcnQgbGF0ZXN0IHN0cnVjdCBodm1fc3RhcnRfaW5mbyBjaGFuZ2Vz
ICh3aGljaCBidW1wZWQKPj4+Pj4+PiBpbnRlcmZhY2UgdmVyc2lvbikgdG8gNC4xMSBhbmQgcGFz
cyBSU0RQIG9ubHkgZm9yIHZlcnNpb25zID49MT8KPj4+Pj4+IEFuZCB0aGlzIHdvdWxkIGhlbHAg
aG93Pwo+Pj4+Pj4KPj4+Pj4+IFJTRFAgYWRkcmVzcyBpcyBwYXNzZWQgdG9kYXksIHRoZSBrZXJu
ZWwganVzdCBkb2Vzbid0IHJlYWQgaXQuIEFuZAo+Pj4+Pj4gaG93IHNob3VsZCBYZW4ga25vdyB3
aGljaCBpbnRlcmZhY2UgdmVyc2lvbiB0aGUga2VybmVsIGlzIHN1cHBvcnRpbmc/Cj4+Pj4+PiBB
bmQgWGVuIG5lZWRzIHRvIGtub3cgdGhhdCBpbiBhZHZhbmNlIGluIG9yZGVyIHRvIHBsYWNlIHRo
ZSBSU0RQIGluCj4+Pj4+PiBsb3cgbWVtb3J5IGluIGNhc2UgdGhlIGtlcm5lbCBpc24ndCByZWFk
aW5nIHRoZSBSU0RQIGFkZHJlc3MgZnJvbQo+Pj4+Pj4gc3RhcnRfaW5mby4KPj4+Pj4gQnV0IHRo
ZSBrZXJuZWwgaW1hZ2UgaGFzIEVMRiBub3RlcywgcmlnaHQ/ICBZb3UgY2FuIHB1dCBvbmUgdGhh
dAo+Pj4+PiBpbmRpY2F0ZXMgdGhhdCB0aGlzIGJpbmFyeSAqZG9lcyoga25vdyBob3cgdG8gcmVh
ZCB0aGUgUlNEUCBmcm9tIHRoZQo+Pj4+PiBzdGFydF9pbmZvLCBhbmQgaWYgeW91IGRvbid0IGZp
bmQgdGhhdCwgcHV0IGl0IGluIGxvd21lbS4KPj4+PiBTb3cgeW91IHdvdWxkIGh1cnQgQlNEIHdo
aWNoIGRvZXMgcmVhZCB0aGUgUlNEUCBhZGRyZXNzIGNvcnJlY3RseSBidXQKPj4+PiAodG9kYXkp
IGhhcyBubyBzdWNoIEVMRiBub3RlLgo+Cj4KPiBUaGlzIGNhbiBiZSBwcmVkaWNhdGVkIG9uCj4g
ICAgIEVMRk5PVEUoWGVuLCBYRU5fRUxGTk9URV9HVUVTVF9PUywgICAgICAgLmFzY2l6ICJsaW51
eCIpCj4KPiBCU0Qgd2lsbCBiZWhhdmUgYXMgaXQgZG9lcyBub3cuIEZvciBsaW51eCB3ZSBjb3Vs
ZCBhZGQgZmVhdHVyZSBmbGFnIChvcgo+IGVycmF0YSBmbGFnKS4gVW5mb3J0dW5hdGVseSBJIGRv
bid0IHNlZSBhIHdheSB0byBleHRyYWN0IG1ham9yLm1pbm9yCj4gZnJvbSB0aGUgaGVhZGVycywg
b3RoZXJ3aXNlIHdlIGNvdWxkIHVzZSB0aGF0LgoKT1RPSCwgb25lIGFkdmFudGFnZSBvZiBoYXZp
bmcgYSBzZXBhcmF0ZSBlbGZub3RlLCByYXRoZXIgdGhhbiBnYXRpbmcKaXQgb24gTGludXggdmVy
c2lvbiwgaXMgdGhhdCBpZiBhIGRpc3RybyB3YW50ZWQgdG8sIHRoZXkgY291bGQgZG8KdGhlaXIg
b3duIGJhY2twb3J0IHRvIChzYXkpIExpbnV4IDQuMTUgYW5kIHJlYXAgdGhlIGFkdmFudGFnZXMu
CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
