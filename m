From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Sat, 22 Dec 2018 12:14:12 +0100
Message-ID: <26a64020-3974-ec4d-f64d-65669e87d505@suse.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
 <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
 <20181129132657.nlzxzqfdvngjsfvk@black.fi.intel.com>
 <bc770271-65a8-8bf4-10f9-6ce169e94130@suse.com>
 <20181206111352.GQ19891@kroah.com>
 <d0f3f0b2-d48b-4cd1-cf6e-e7a8176dd0da@suse.com>
 <20181206114609.GA19522@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Q60C=O7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gafEX-0000vI-0X
 for xen-devel@lists.xenproject.org; Sat, 22 Dec 2018 11:14:17 +0000
In-Reply-To: <20181206114609.GA19522@kroah.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <greg@kroah.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAxMjo0NiwgR3JlZyBLSCB3cm90ZToKPiBPbiBUaHUsIERlYyAwNiwgMjAx
OCBhdCAxMjozMToxNVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwNi8xMi8y
MDE4IDEyOjEzLCBHcmVnIEtIIHdyb3RlOgo+Pj4gT24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDI6
MzU6MTdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiBPbiAyOS8xMS8yMDE4IDE0
OjI2LCBLaXJpbGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4+Pj4+IE9uIFRodSwgTm92IDI5LCAyMDE4
IGF0IDA5OjQxOjI1QU0gKzAwMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBPbiAyOS8x
MS8yMDE4IDAyOjIyLCBIYW5zIHZhbiBLcmFuZW5idXJnIHdyb3RlOgo+Pj4+Pj4+IEhpLAo+Pj4+
Pj4+Cj4+Pj4+Pj4gQXMgYWxzbyBzZWVuIGF0Ogo+Pj4+Pj4+IGh0dHBzOi8vYnVncy5kZWJpYW4u
b3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9OTE0OTUxCj4+Pj4+Pj4KPj4+Pj4+PiBBdHRh
Y2hlZCB0aGVyZSBhcmUgdHdvIHNlcmlhbCBjb25zb2xlIG91dHB1dCBsb2dzLiBPbmUgaXMgc3Rh
cnRpbmcgd2l0aAo+Pj4+Pj4+IFhlbiA0LjExIChmcm9tIGRlYmlhbiB1bnN0YWJsZSkgYXMgZG9t
MCwgYW5kIHRoZSBvdGhlciBvbmUgd2l0aG91dCBYZW4uCj4+Pj4+Pj4KPj4+Pj4+PiBbICAgIDIu
MDg1NTQzXSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0Cj4+
Pj4+Pj4gZmZmZjg4OGQ5ZmZmYzAwMAo+Pj4+Pj4+IFsgICAgMi4wODU2MTBdIFBHRCAyMDBjMDY3
IFA0RCAyMDBjMDY3IFBVRCAwCj4+Pj4+Pj4gWyAgICAyLjA4NTY3NF0gT29wczogMDAwMCBbIzFd
IFNNUCBOT1BUSQo+Pj4+Pj4+IFsgICAgMi4wODU3MzZdIENQVTogMSBQSUQ6IDEgQ29tbTogc3dh
cHBlci8wIE5vdCB0YWludGVkCj4+Pj4+Pj4gNC4xOS4wLXRydW5rLWFtZDY0ICMxIERlYmlhbiA0
LjE5LjUtMX5leHAxK3B2aDEKPj4+Pj4+PiBbICAgIDIuMDg1ODIzXSBIYXJkd2FyZSBuYW1lOiBI
UCBQcm9MaWFudCBETDM2MCBHNywgQklPUyBQNjggMDUvMjEvMjAxOAo+Pj4+Pj4+IFsgICAgMi4w
ODU4OTVdIFJJUDogZTAzMDpwdGR1bXBfd2Fsa19wZ2RfbGV2ZWxfY29yZSsweDFmZC8weDQ5MAo+
Pj4+Pj4+IFsuLi5dCj4+Pj4+Pgo+Pj4+Pj4gVGhlIG9mZmVuZGluZyBzdGFibGUgY29tbWl0IGlz
IDQwNzRjYTdkOGExODMyOTIxYzg2NWQyNTBiYmQwOGYzNDQxYjM2NTcKPj4+Pj4+ICgieDg2L21t
OiBNb3ZlIExEVCByZW1hcCBvdXQgb2YgS0FTTFIgcmVnaW9uIG9uIDUtbGV2ZWwgcGFnaW5nIiks
IHRoaXMKPj4+Pj4+IGlzIGNvbW1pdCBkNTI4ODhhYTI3NTNlMzA2M2E5ZDNhMGM5ZjcyZjk0YWE5
ODA5YzE1IHVwc3RyZWFtLgo+Pj4+Pj4KPj4+Pj4+IEN1cnJlbnQgdXBzdHJlYW0ga2VybmVsIGlz
IGJvb3RpbmcgZmluZSB1bmRlciBYZW4sIHNvIGluIGdlbmVyYWwgdGhlCj4+Pj4+PiBwYXRjaCBz
aG91bGQgYmUgZmluZS4gVXNpbmcgYW4gdXBzdHJlYW0ga2VybmVsIGJ1aWx0IGZyb20gYWJvdmUg
Y29tbWl0Cj4+Pj4+PiAod2l0aCB0aGUgdGhlbiBuZWVkZWQgWGVuIGZpeHVwIHBhdGNoIDE0NTdk
OGNmNzY2NGYzNGM0YmE1MzQpIGlzIGZpbmUsCj4+Pj4+PiB0b28uCj4+Pj4+Pgo+Pj4+Pj4gS2ly
aWxsLCBhcmUgeW91IGF3YXJlIG9mIGFueSBwcmVyZXF1aXNpdGUgcGF0Y2ggZnJvbSA0LjIwIHdo
aWNoIGNvdWxkIGJlCj4+Pj4+PiBtaXNzaW5nIGluIDQuMTkuNT8KPj4+Pj4KPj4+Pj4gSSdtIG5v
dC4KPj4+Pj4KPj4+Pj4gTGV0IG1lIGxvb2sgaW50byB0aGlzLgo+Pj4+Pgo+Pj4+Cj4+Pj4gV2hh
dCBpcyBtYWtpbmcgbWUgc3VzcGljaW91cyBpcyB0aGUgZmFpbHVyZSBoYXBwZW5pbmcganVzdCBh
ZnRlcgo+Pj4+IHJlbGVhc2luZyB0aGUgaW5pdCBtZW1vcnkuIE1heWJlIHRoZXJlIGlzIGFuIGFj
Y2VzcyB0byAuaW5pdC5kYXRhCj4+Pj4gc2VnbWVudCBvciBzaW1pbGFyPyBUaGUgbmF0aXZlIGtl
cm5lbCBib290aW5nIGNvdWxkIGJlIHJlbGF0ZWQgdG8gdGhlCj4+Pj4gdXNhZ2Ugb2YgMk0gbWFw
cGluZ3Mgbm90IGJlaW5nIGF2YWlsYWJsZSBpbiBhIFBWLWRvbWFpbi4KPj4+Cj4+PiBEaWQgdGhp
cyBldmVyIGdldCBmaXhlZCBhbnl3aGVyZSB0aGF0IEkgY2FuIHByb3Blcmx5IGJhY2twb3J0IGl0
IHRvIHRoZQo+Pj4gNC4xOS55IHRyZWU/Cj4+Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvMjAxODExMzAyMDIzMjguNjUzNTktMi1raXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29t
Lwo+Pgo+PiBTdGlsbCBwZW5kaW5nIHVwc3RyZWFtLiBKdXN0IHBpbmdlZCB0Z2x4Lgo+IAo+IFRo
YW5rcywgaXQgc2hvdWxkIGhhdmUgZ290dGVuIGEgY2M6IHN0YWJsZUAgdGFnLCBidXQgSSBjYW4g
d2F0Y2ggb3V0IGZvcgo+IGl0Li4uCgpJdCdzIHVwc3RyZWFtIG5vdzogY29tbWl0IDE2ODc3YTU1
NzBlMGM1ZjQyNzBkNWIxN2Y5YmFiNDI3YmNhZTk1MTQKCgpKdWVyZ2VuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
