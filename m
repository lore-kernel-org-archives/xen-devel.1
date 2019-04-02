From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 00/15] Add support for Hygon Dhyana
 Family 18h processor
Date: Tue, 02 Apr 2019 10:15:09 -0600
Message-ID: <5CA38A8D0200007800223FC4@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <af3a73b3-d1d3-4cd0-0758-d457e1a6549a@citrix.com>
 <07149eb5-7025-d069-a7d1-6bf271e630a5@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBM4B-0002IM-OY
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:15:15 +0000
In-Reply-To: <07149eb5-7025-d069-a7d1-6bf271e630a5@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDE4OjAwLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvNC8yIDIzOjE0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAzMC8wMy8yMDE5IDEwOjQw
LCBQdSBXZW4gd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIHNlcmllcyBoYXZlIGJlZW4gYXBwbGllZCBh
bmQgdGVzdGVkIHN1Y2Nlc3NmdWxseSBvbiBIeWdvbgo+Pj4gRGh5YW5hIHByb2Nlc3NvciwgYWxz
byBiZWVuIHRlc3RlZCBvbiBBTUQgRVBZQyAoZmFtaWx5IDE3aCkgcHJvY2Vzc29yLgo+Pj4gSXQg
d29ya3MgZmluZSBhbmQgbWFrZXMgbm8gaGFybSB0byB0aGUgZXhpc3RpbmcgY29kZS4KPj4+Cj4+
PiBSZWZlcmVuY2U6Cj4+PiBbMV0gCj4gaHR0cHM6Ly93d3cuYW1kLmNvbS9zeXN0ZW0vZmlsZXMv
VGVjaERvY3MvNTQ5NDVfUFBSX0ZhbWlseV8xN2hfTW9kZWxzXzAwaC0wRmggCj4gLnBkZgo+PiAK
Pj4gT25lIHRoaW5nIEkgZG9uJ3Qgc2VlIGluIHRoaXMgc2VyaWVzIGlzIGFueXRoaW5nIGFib3V0
IG1pY3JvY29kZQo+IAo+IFJpZ2h0IG5vdyBIeWdvbiBsb2FkIG1pY3JvY29kZSBpbiBCSU9TLgo+
IAo+PiBsb2FkaW5nLiAgUHJlc3VtYWJseSB5b3UnbGwgZm9sbG93IHRoZSBBTUQgcGF0Y2hsb2Fk
aW5nIG1lY2hhbmlzbSwgd2l0aAo+PiBhIGJsb2IgeW91IHByb3ZpZGUgeW91cnNlbGY/Cj4gCj4g
V2UgYXJlIGV4cGxvcmluZyB0aGUgSHlnb24gcGF0Y2hsb2FkaW5nIG1lY2hhbmlzbSwgd2hpY2gg
d2lsbCBlbXBsb3kgCj4gbW9zdCBvZiB0aGUgZnVuY3Rpb25zIG9mIEFNRCdzLiBXZSBhbHNvIHRy
eSB0byBtYWtlIHRoZSBIeWdvbiBtaWNyb2NvZGUgCj4gYmxvYiBiZSBjb21wYXRpYmxlIHdpdGgg
dGhlIEFNRCBvbmUuCj4gCj4gV2hlbiB0aGUgSHlnb24gcGF0Y2hsb2FkaW5nIG1lY2hhbmlzbSBp
cyBwcmFjdGljYWJsZSBhbmQgaXQncyBuZWNlc3NhcnkgCj4gdG8gbG9hZCB0aGUgSHlnb24gbWlj
cm9jb2RlIG91dHNpZGUgb2YgQklPUywgd2UnbGwgc2VuZCB0aGUgcGF0Y2hsb2FkaW5nIAo+IHBh
dGNoZXMgdG8gWGVuIGFuZCBMaW51eCBtYWlsaW5nIGxpc3RzLgoKSSBzdXBwb3NlIGJvdGggSW50
ZWwgYW5kIEFNRCBoYWQgdGhpcyBzYW1lIGludGVudGlvbiBvZiB1Y29kZSBsb2FkaW5nCmJlaW5n
IGEgZmlybXdhcmUgam9iIG9ubHksIGFuZCB3ZSBzZWUgd2hlcmUgd2UgYXJlIHJpZ2h0IG5vdy4g
QXMgbG9uZwphcyB1cGRhdGVkIGZpcm13YXJlIGRvZXMgbm90IGJlY29tZSBhdmFpbGFibGUgaW4g
YSB0aW1lbHkgbWFubmVyIChvcgpwZXJoYXBzIG5vdCBhdCBhbGwsIGJlY2F1c2Ugb2YgYSB2ZW5k
b3IgY29uc2lkZXJpbmcgYSBjZXJ0YWluIHN5c3RlbQpFT0wpLCB0aGVyZSdzIGdvaW5nIHRvIGJl
IGEgbmVlZCB0byBiZSBhYmxlIHRvIGxvYWQgaXQgZnJvbSB0aGUgT1MuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
