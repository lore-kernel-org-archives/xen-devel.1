From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/sched: Introduce domain_vcpu() helper
Date: Thu, 24 Jan 2019 16:31:46 +0000
Message-ID: <2340ddd9-5c57-0249-c55d-984e100c747e@citrix.com>
References: <1548255569-23334-1-git-send-email-andrew.cooper3@citrix.com>
 <20190124163119.bhamyy3cloesuk7v@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190124163119.bhamyy3cloesuk7v@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAxNjozMSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEphbiAyMywgMjAx
OSBhdCAwMjo1OToyOVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBUaGUgcHJvZ3Jl
c3Npb24gb2YgbXVsdGktdmNwdSBzdXBwb3J0IGluIFhlbiAob3JpZ2luYWxseSBhIHNpbmdsZSBw
b2ludGVyLAo+PiB0aGVuIGFuIGVtYmVkZGVkIGQtPnZjcHVbXSBhcnJheSwgdGhlbiBhIGR5bmFt
aWNhbGx5IGFsbG9jYXRlZCBhcnJheSkgaGFzCj4+IHJlc3VsdGVkIGluIGEgbGFyZ2UgcXVhbnRp
dHkgb2YgYWQtaG9jIGNvZGUgZm9yIGxvb2tpbmcgYSB2Y3B1IHVwIGJ5IGlkLCBhbmQgYQo+PiBs
YXJnZSBudW1iZXIgb2Ygd2F5cyB0aGF0IHRoZSB0b29sc3RhY2sgY2FuIGNhdXNlIFhlbiB0byB0
cmlwIG92ZXIgYSBOVUxMCj4+IHBvaW50ZXIuICBTb21lIG9mIHRoaXMgaGFzIGJlZW4gYWRkcmVz
c2VkIGluIFhlbiA0LjEyLCBhbmQgd29yayBpcyBvbmdvaW5nLgo+Pgo+PiBBbm90aGVyIHByb3Bl
cnR5IG9mIGxvb2tpbmcgYSB2Y3B1IHVwIGJ5IGlkIGlzIGZyZXF1ZW50bHkgZG9uZSBpbiB1bnBy
aXZpbGVnZWQKPj4gaHlwZXJjYWxsIGNvbnRleHQsIG1ha2luZyBpdCBhbiBhdHRyYWN0aXZlIHRh
cmdldCBmb3Igc3BlY3VsYXRpdmUgc2lkZWNoYW5uZWwKPj4gYXR0YWNrcy4KPj4KPj4gSW50cm9k
dWNlIGEgaGVscGVyIHRvIGRvIHRoZSBsb29rdXAgY29ycmVjdGx5LCBhbmQgd2l0aG91dCBzcGVj
dWxhdGl2ZQo+PiBpbnRlcmZlcmVuY2UuICBGb3IgcGVyZm9ybWFuY2UgcmVhc29ucywgaXQgaXMg
dXNlZnVsIG5vdCB0byBoYXZlIGFuIHNtcF9ybWIoKQo+PiBpbiB0aGlzIGhlbHBlciBvbiBBUk0s
IGFuZCBsdWNraWx5IHRoaXMgaXMgc2FmZSB0byBkbywgYmVjYXVzZSBvZiB0aGUKPj4gc2VyaWFs
aXNhdGlvbiBvZmZlcmVkIGJ5IHRoZSBnbG9iYWwgZG9taGVhcCBsb2NrLgo+IEkgdGhpbmsgeW91
IG1lYW4gZG9tbGlzdCBsb2NrIGhlcmU/CgpJIGRvIGluZGVlZC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
