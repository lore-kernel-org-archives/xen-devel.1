From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation [and 1 more messages]
Date: Mon, 1 Oct 2018 14:58:15 +0100
Message-ID: <0bce1a27-9eee-7a5b-d837-f5d7fb4d006d@citrix.com>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <ba4e6e5f-b342-10e5-971e-1e71d50b3073@citrix.com>
 <20180626191113.2d8e6876.olaf@aepfle.de>
 <20180801181747.170405d8.olaf@aepfle.de>
 <20180913093913.328a523a.olaf@aepfle.de>
 <20180928155052.5d7f66db.olaf@aepfle.de>
 <23473.64592.699718.316856@mariner.uk.xensource.com>
 <5BB2044402000078001ED2E9@prv1-mh.provo.novell.com>
 <23474.8196.147587.640122@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23474.8196.147587.640122@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMTggMTQ6MjQsIElhbiBKYWNrc29uIHdyb3RlOgo+Cj4+PiBoYW5kbGVfdHNjX2lu
Zm8gaGFzIG5vIGNvZGUgdG8gdmVyaWZ5IHRoYXQgcGFkZGluZyBpcyBpbmRlZWQgemVyby4gRHVl
Cj4+PiB0byB0aGUgbGFjayBvZiBhIHZlcnNpb24gZmllbGQgaXQgaXMgaW1wb3NzaWJsZSB0byBr
bm93IGlmIHRoZSBzZW5kZXIKPj4+IGFscmVhZHkgaGFzIHRoZSBuZXdseSBpbnRyb2R1Y2VkIHZ0
c2NfdG9sZXJhbmNlIGZpZWxkLiBJbiB0aGUgd29yc3QKPj4+IGNhc2UgdGhlIHJlY2VpdmluZyBk
b21VIHdpbGwgZ2V0IGFuIHVuZW11bGF0ZWQgVFNDLgo+PiBUaGUgbGFjayBvZiBwYWRkaW5nIHZl
cmlmaWNhdGlvbiBpcyBkZWxpYmVyYXRlLCBmb3IgZm9yd2FyZHMKPj4gY29tcGF0aWJpbGl0eS7C
oCBXaHkgZG9lcyB0aGUgc2VuZGluZyBjb2RlIG1hdHRlcj/CoCBPbmUgd2F5IG9yIGFub3RoZXIs
Cj4+IGlmIHRoZSBmaWVsZCBpcyAwLCB0aGUgb3B0aW9uIHdhc24ndCBwcmVzZW50IG9yIHdhc24n
dCBjb25maWd1cmVkLsKgCj4+IE5laXRoZXIgb2YgdGhlc2Ugc2l0dWF0aW9ucyBhZmZlY3QgdGhl
IGRlY2lzaW9uLW1ha2luZyB0aGF0IHRoZQo+PiByZWNlaXZpbmcgc2lkZSBuZWVkcyB0byBwZXJm
b3JtLgo+IFdlIGFyZSB0YWxraW5nIGhlcmUgYWJvdXQgYW4gdW51c2VkIGZpZWxkIHRoYXQgaXMg
KHN1cHBvc2VkbHk/KQo+IGFsd2F5cyBzZW50IGFzIHplcm8gPwoKVGhlIHNwZWMgcmVxdWlyZXMg
dGhlIHBhZGRpbmcgdG8gYWx3YXlzIGJlIHNlbnQgYXMgemVybywgYW5kCnZlcmlmeS1zdHJlYW0t
djIgZG9lcyBjaGVjayB0aGUgcGFkZGluZyBhbmQgb2JqZWN0IHRvIG5vbi16ZXJvIHZhbHVlcy4K
CmxpYnhjJ3Mgd3JpdGVfdHNjX2luZm8oKSBoYXMgYWx3YXlzIGZ1bGx5IHplcm9lZCB0aGUgc3Ry
dWN0dXJlLCBhbmQKY29udmVydC1sZWdhY3ktc3RyZWFtIGFsc28gYmVoYXZlcyB0aGUgc2FtZSB3
YXkuwqAgSG93ZXZlciwgSSBub3RpY2UgdGhpcwpjaGFuZ2Ugd2lsbCBicmVhayBtaWdyYXRpb24g
ZnJvbSBwcmUgNC42IGFzIHdyaXRlX2xpYnhjX3RzY19pbmZvKCkgbm93CmhhcyBhIG1pc21hdGNo
ZWQgbnVtYmVyIG9mIHBhcmFtZXRlcnMgdG8gcGFjayBhbmQgdGhyb3cgYW4gZXhjZXB0aW9uLgoK
Pgo+IEFJVUk6Cj4KPiBJbiB0aGUgbmV3IGNvZGUgdGhlIHNlbWFudGljcyBvZiB6ZXJvIGlzICJk
byBub3QgYWxsb3cgYW55IHRvbGVyYW5jZSIuCj4gVGhlIG9sZCBjb2RlIGhhbmRsZXMgdGhpcyBj
b3JyZWN0bHkuICBUaGUgaXNzdWUgaXMgd2l0aCBtaWdyYXRpb25zCj4gZnJvbSBuZXcgY29kZSB0
byBvbGQ6IHRoZSB0b2xlcmFuY2UgdmFsdWUgd2lsbCBzaWxlbnRseSBpZ25vcmVkLgoKTWlncmF0
aW5nIGZyb20gbmV3IHRvIG9sZCBkb2Vzbid0IHJlbW90ZWx5IHdvcmssIGFuZCB3aGV0aGVyIHRo
aW5ncwpleHBsb2RlIG9yIG5vdCBpcyB2ZXJ5IGNvbnRleHQgZGVwZW5kZW50LgoKSSdtIG5vdCBz
dXJlIGl0cyB3b3J0aCBjYXJpbmcgYWJvdXQgdGhpcyBjYXNlLsKgIFdlIG5ldmVyIGhhdmUgYmVm
b3JlLsKgCihHZXR0aW5nIGJhY2t3YXJkcyBtaWdyYXRpb24gd29ya2luZyBmb3IgZW1lcmdlbmN5
IGNhc2VzIGlzIG9uIG15IFRPRE8KbGlzdCwgYnV0IGl0IGlzIGRlcGVuZGVudCBvbiByZXdyaXRp
bmcgdGhlIGh5cGVydmlzb3IgaW50ZXJmYWNlcyBmb3IKZ2V0dGluZy9zZXR0aW5nIGd1ZXN0IHN0
YXRlLikKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
