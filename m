From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Thu, 31 Jan 2019 03:35:23 -0700
Message-ID: <5C52CF6B02000078002129C1@prv1-mh.provo.novell.com>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <1548064795-18160-10-git-send-email-christopher.w.clark@gmail.com>
 <20190122120822.v5eyc64fa4moourd@mac>
 <CACMJ4GYpwHyqaPzXzTWQrHecW068ipfyDOrNz-MD9Y+jGB18eQ@mail.gmail.com>
 <20190131101809.kcbexwtqqkjvgzfq@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gp9gt-0006uZ-1V
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 10:35:27 +0000
In-Reply-To: <20190131101809.kcbexwtqqkjvgzfq@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDExOjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0IDA4OjEwOjI4UE0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiBPbiBUdWUsIEphbiAyMiwgMjAxOSBhdCA0OjA4IEFNIFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4gPiBPbiBNb24sIEphbiAyMSwg
MjAxOSBhdCAwMTo1OTo0OUFNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPj4gPiA+
ICsgICAgICAgIC8qCj4+ID4gPiArICAgICAgICAgKiBDaGVjayBwYWRkaW5nIGlzIHplcm9lZC4g
UmVqZWN0IG5pb3YgYWJvdmUgbGltaXQgb3IgbWVzc2FnZV90eXBlcwo+PiA+ID4gKyAgICAgICAg
ICogdGhhdCBhcmUgb3V0c2lkZSAzMiBiaXQgcmFuZ2UuCj4+ID4gPiArICAgICAgICAgKi8KPj4g
PiA+ICsgICAgICAgIGlmICggdW5saWtlbHkoc2VuZF9hZGRyLnNyYy5wYWQgfHwgc2VuZF9hZGRy
LmRzdC5wYWQgfHwKPj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKGFyZzMgPiBYRU5fQVJH
T19NQVhJT1YpIHx8IChhcmc0ICYgfjB4ZmZmZmZmZmZVTCkpICkKPj4gPgo+PiA+IGFyZzQgJiAo
R0IoNCkgLSAxKQo+PiA+Cj4+ID4gSXMgY2xlYXJlciBJTU8sIG9yOgo+PiA+Cj4+ID4gYXJnNCA+
IFVJTlQzMl9NQVgKPj4gCj4+IEkndmUgbGVmdCB0aGUgY29kZSB1bmNoYW5nZWQsIGFzIHRoZSBt
YXNrIGNvbnN0YW50IGlzIHVzZWQgbXVsdGlwbGUKPj4gcGxhY2VzIGVsc2V3aGVyZSBpbiBYZW4u
IFVJTlQzMl9NQVggaXMgb25seSB1c2VkIGFzIGEgdGhyZXNob2xkIHZhbHVlLgo+IAo+IFRoZSBm
YWN0IHRoYXQgb3RoZXJzIHBhcnRzIG9mIHRoZSBjb2RlIGNvdWxkIGJlIGltcHJvdmVkIGlzIG5v
dCBhbgo+IGV4Y3VzZSB0byBmb2xsb3cgc3VpdC4gSSdtIGhhdmluZyBhIGhhcmQgdGltZSBiZWxp
ZXZpbmcgdGhhdCB5b3UgZmluZAo+ICJhcmc0ICYgfjB4ZmZmZmZmZmZVTCIgZWFzaWVyIHRvIHJl
YWQgdGhhbiAiYXJnNCAmIH4oR0IoNCkgLSAxKSIgb3IKPiBldmVuICJhcmc0ID49IEdCKDQpIi4K
PiAKPiBJTU8gaXQncyBtdWNoIG1vcmUgbGlrZWx5IHRvIG1pc3MgYW4gJ2YnIGluIHRoZSBmaXJz
dCBjb25zdHJ1Y3QsIGFuZAo+IHRodXMgZ2V0IHRoZSB2YWx1ZSB3cm9uZyBhbmQgaW50cm9kdWNl
IGEgYnVnLgoKSSBhZ3JlZSB3aXRoIHRoaXMgbGFzdCBzdGF0ZW1lbnQsIGJ1dCBJJ20gaGF2aW5n
IHRyb3VibGUgdG8gc2VlIGhvdwptZXNzYWdlIF90eXBlXyBpcyByZWxhdGVkIHRvIGEgc2l6ZSBj
b25zdHJ1Y3QgbGlrZSBHQig0KSBpcy4gSSBzZWUKb25seSBVSU5UMzJfTUFYIGFzIGEgdmlhYmxl
IGFsdGVybmF0aXZlIGZvciBzb21ldGhpbmcgdGhhdCdzIG5vdApleHByZXNzaW5nIHRoZSBzaXpl
IG9mIGFueXRoaW5nLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
