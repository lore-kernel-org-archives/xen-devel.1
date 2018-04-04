From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Patches for stable
Date: Wed, 4 Apr 2018 16:46:44 +0200
Message-ID: <20180404144644.GA22656__46494.519399903$1522853141$gmane$org@kroah.com>
References: <a38538ef-d766-adb9-77d7-4624cf1dd749@suse.com>
 <20180404142702.GA20460@kroah.com>
 <e17d3e80-b019-ac09-d796-771ed38d91e5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2uyw=gz=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1f3jgU-0007Ef-ML
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 14:46:46 +0000
Content-Disposition: inline
In-Reply-To: <e17d3e80-b019-ac09-d796-771ed38d91e5@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMDQ6MzA6MzBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwNC8wNC8xOCAxNjoyNywgR3JlZyBLSCB3cm90ZToKPiA+IE9uIFdlZCwgQXBy
IDA0LCAyMDE4IGF0IDEyOjM4OjQzUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4g
UGxlYXNlIGFkZCB0aGUgcGF0Y2hlczoKPiA+Pgo+ID4+IGNvbW1pdCAwMzhiYWMyYjAyOTg5YWNm
MWZjOTM4Y2VkY2I3OTQ0YzAyNjcyYjlmIHVwc3RyZWFtCj4gPj4gY29tbWl0IGRmYzkzMjdhYjdj
OTliYzEzZTEyMTA2NDQ4NjE1ZWZiYTgzMzg4NmIgdXBzdHJlYW0KPiA+PiBjb21taXQgYjE3ZDlk
MWRmM2MzM2E0ZjFkMmJmMzk3ZTIyNTdhZWNmOWRjNTZkNCB1cHN0cmVhbQo+ID4+Cj4gPj4gdG8g
dGhlIDQuMTUgYW5kIDQuMTYgc3RhYmxlIGtlcm5lbHMuCj4gPj4KPiA+PiBUaG9zZSBwYXRjaGVz
IGFyZSBuZWVkZWQgdG8gYm9vdCBMaW51eCBhcyBQVkggZ3Vlc3Qgb24gcmVjZW50IFhlbi4KPiA+
IAo+ID4gU28gYSBuZXcgZmVhdHVyZT8gIFdoeSBpcyB0aGF0IG9rIGZvciBzdGFibGUga2VybmVs
cz8KPiAKPiBJdCB3b3JrcyBmb3Iga2VybmVscyBzaW5jZSBhdCBsZWFzdCA0LjExIG9uIFhlbiA0
LjEwLgoKR3JlYXQsIHNvIHdoYXQgY29tbWl0IGNhdXNlZCB0aGlzIHRvIGZhaWw/CgpTbyBmYXIs
IGluIHJlYWRpbmcgdGhvc2UgY29tbWl0cywgaXQgc291bmRzIGxpa2UgdGhleSBhcmUgIm1ha2Ug
TGludXgKd29yayBhZ2FpbiBkdWUgdG8gY2hhbmdlcyBpbiBYZW4iLiAgVGhhdCBzb3VuZHMgbGlr
ZSBhIHByZXR0eSBiYWQgdGhpbmcKdGhhdCBYZW4gZGlkLCB3aHkgZG8gd2UgaGF2ZSB0byBmaXgg
dXAgdGhlaXIgbWVzcz8KCj4gPj4gSW4gUFZIIG1vZGUgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHRo
ZSBrZXJuZWwgY2FuIGZpbmQgdGhlIFJTRFAgdGFibGUKPiA+PiBhdCB0aGUgbGVnYWN5IGxvY2F0
aW9uIGluIGxvdyBtZW1vcnksIHdoaWNoIGlzIGEgcmVxdWlyZW1lbnQgZm9yIHRoZQo+ID4+IGtl
cm5lbCB0byBib290IHN1Y2Nlc3NmdWwgd2l0aG91dCB0aG9zZSBwYXRjaGVzLgo+ID4gCj4gPiBX
aHkgbm90IGp1c3QgdXNlIG5ld2VyIGtlcm5lbHMgZm9yIG5ldyBYZW4gZmVhdHVyZXM/ICBUaGlz
IHJlYWxseQo+ID4gZG9lc24ndCBsb29rIGxpa2UgYSBidWdmaXggdG8gbWUsIGRvZXMgaXQgdG8g
eW91Pwo+IAo+IEl0IGRvZXMuIEEgd29ya2luZyBzZXR1cCB3aWxsIG5vIGxvbmdlciB3b3JrIGlm
IFhlbiB2ZXJzaW9uIGlzIHVwZ3JhZGVkCj4gdG8gNC4xMS4KCldoeSBpc24ndCB0aGlzIGEgcmVn
cmVzc2lvbiBpbiBYZW4gdGhhdCB0aGV5IGZpeD8gIFdoeSBhcmUgd2UKcmVzcG9uc2libGUgZm9y
IGFkZGluZyBuZXcga2VybmVsIGZlYXR1cmVzIHRvIHdvcmsgb24gbmV3ZXIgdmVyc2lvbnMgb2YK
WGVuIGFuZCBiYWNrcG9ydCB0aGVtIHRvIG9sZGVyIGtlcm5lbHM/Cgp0aGFua3MsCgpncmVnIGst
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
