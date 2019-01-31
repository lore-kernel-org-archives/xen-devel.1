From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Thu, 31 Jan 2019 09:58:18 -0700
Message-ID: <5C53292A0200007800212E84@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-10-git-send-email-christopher.w.clark@gmail.com>
 <20190131163543.w5vqmdtawzonqpkj@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gpFfT-0002rN-0e
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 16:58:23 +0000
In-Reply-To: <20190131163543.w5vqmdtawzonqpkj@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDE3OjM1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0IDA4OjI4OjE0UE0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiArc3RhdGljIGludAo+PiArcmluZ2J1Zl9pbnNlcnQoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGFyZ29fcmluZ19pbmZvICpyaW5nX2luZm8sCj4+ICsgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgYXJnb19yaW5nX2lkICpzcmNfaWQsIHhlbl9hcmdvX2lvdl90
ICppb3ZzLAo+PiArICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5pb3YsIHVpbnQzMl90IG1l
c3NhZ2VfdHlwZSwKPj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKm91dF9sZW4pCj4+
ICt7Cj4+ICsgICAgeGVuX2FyZ29fcmluZ190IHJpbmc7Cj4+ICsgICAgc3RydWN0IHhlbl9hcmdv
X3JpbmdfbWVzc2FnZV9oZWFkZXIgbWggPSB7IH07Cj4+ICsgICAgaW50IHNwLCByZXQ7Cj4+ICsg
ICAgdW5zaWduZWQgaW50IGxlbiA9IDA7Cj4+ICsgICAgeGVuX2FyZ29faW92X3QgKnBpb3Y7Cj4+
ICsgICAgWEVOX0dVRVNUX0hBTkRMRSh1aW50OCkgTlVMTF9obmQgPSB7IH07Cj4+ICsKPj4gKyAg
ICBBU1NFUlQoTE9DS0lOR19MMyhkLCByaW5nX2luZm8pKTsKPj4gKwo+PiArICAgIC8qCj4+ICsg
ICAgICogT2J0YWluIHRoZSB0b3RhbCBzaXplIG9mIGRhdGEgdG8gdHJhbnNtaXQgLS0gc2V0cyB0
aGUgJ2xlbicgdmFyaWFibGUKPj4gKyAgICAgKiAtLSBhbmQgc2FuaXR5IGNoZWNrIHRoYXQgdGhl
IGlvdnMgY29uZm9ybSB0byBzaXplIGFuZCBudW1iZXIgbGltaXRzLgo+PiArICAgICAqIEVuZm9y
Y2VkIGJlbG93OiBubyBtb3JlIHRoYW4gJ2xlbicgYnl0ZXMgb2YgZ3Vlc3QgZGF0YQo+PiArICAg
ICAqIChwbHVzIHRoZSBtZXNzYWdlIGhlYWRlcikgd2lsbCBiZSBzZW50IGluIHRoaXMgb3BlcmF0
aW9uLgo+PiArICAgICAqLwo+PiArICAgIHJldCA9IGlvdl9jb3VudChpb3ZzLCBuaW92LCAmbGVu
KTsKPj4gKyAgICBpZiAoIHJldCApCj4+ICsgICAgICAgIHJldHVybiByZXQ7Cj4+ICsKPj4gKyAg
ICAvKgo+PiArICAgICAqIFVwcGVyIGJvdW5kIGNoZWNrIHRoZSBtZXNzYWdlIGxlbiBhZ2FpbnN0
IHRoZSByaW5nIHNpemUuCj4+ICsgICAgICogVGhlIG1lc3NhZ2UgbXVzdCBub3QgZmlsbCB0aGUg
cmluZzsgdGhlcmUgbXVzdCBiZSBhdCBsZWFzdCBvbmUgc2xvdAo+PiArICAgICAqIHJlbWFpbmlu
ZyBzbyB3ZSBjYW4gZGlzdGluZ3Vpc2ggYSBmdWxsIHJpbmcgZnJvbSBhbiBlbXB0eSBvbmUuCj4+
ICsgICAgICogaW92X2NvdW50IGhhcyBhbHJlYWR5IHZlcmlmaWVkOiBsZW4gPD0gTUFYX0FSR09f
TUVTU0FHRV9TSVpFLgo+PiArICAgICAqLwo+PiArICAgIGlmICggKFJPVU5EVVBfTUVTU0FHRShs
ZW4pICsgc2l6ZW9mKHN0cnVjdCB4ZW5fYXJnb19yaW5nX21lc3NhZ2VfaGVhZGVyKSkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtaXNzaW5nIHNwYWNlIAo+IF4KPj4gKyAgICAgICAgICAgID49IHJpbmdfaW5mby0+bGVuICkK
PiAKPiBBbGlnbiBvZiA+PSBhbHNvIGxvb2tzIHdlaXJkLCBzaG91bGQgYmUgYWxpZ25lZCB0byB0
aGUgcGFyZW50aGVzaXMKPiBiZWZvcmUgUk9VTkRVUF8uCgpXZWxsLCB0byBiZSBwcmVjaXNlIHRo
ZSA+PSBiZWxvbmdzIGF0IHRoZSBlbmQgb2YgdGhlIHByZXZpb3VzIGxpbmUsCnNvIHBlcmhhcHMg
dGhlIGxpbmUgd3JhcHBpbmcgd2FudHMgdG8gYmUgY2hhbmdlZCBhbHRvZ2V0aGVyLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
