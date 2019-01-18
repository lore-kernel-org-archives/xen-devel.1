From: Praveen Kumar <kpraveen.lkml@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] xen: credit2: rb-tree for
 runqueues
Date: Fri, 18 Jan 2019 11:14:36 +0530
Message-ID: <CABcWhv4njWab=ikYOM0fSWV6PJug4tfttwQVquCJKdSNqB7qJA@mail.gmail.com>
References: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TnUD=P2=gmail.com=kpraveen.lkml@srs-us1.protection.inumbo.net>)
 id 1gkMxV-0007KP-UA
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 05:44:49 +0000
Received: by mail-io1-xd43.google.com with SMTP id m19so9821544ioh.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jan 2019 21:44:48 -0800 (PST)
In-Reply-To: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKT24gRnJpLCBKYW4gNCwgMjAxOSBhdCAzOjIxIFBNIFByYXZlZW4gS3VtYXIgPGtw
cmF2ZWVuLmxrbWxAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsbCwKPgo+IFRoaXMgaXMgdGhl
IGNvbnRpbnVlZCB3b3JrIHdpdGggcmVzcGVjdCB0byByYi10cmVlIHVzYWdlIGluIENyZWRpdDIs
IGFzCj4gbWVudGlvbmVkIGluIHByZXZpb3VzIGNvbnZlcnNhdGlvbnMKPgo+IGh0dHBzOi8vbGlz
dHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTA2L21zZzAxOTY4Lmh0bWwK
PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wNC9t
c2cwMDExOS5odG1sCj4KPiBUaGUgcGF0Y2ggb3B0aW1pemVkIHRoZSBDcmVkaXQyIHJ1bnF1ZXVl
IGZyb20gc29ydGVkIHF1ZXVlIHRvIHJiLXRyZWUuCj4gVGhpcyB3aWxsIGhlbHAgaW4gcGVyZm9y
bWFuY2UgYW5kIHNjYWxhYmlsaXR5LCB3aGVuIHdlIGhhdmUgaHVnZSBudW1iZXIgb2YKPiB2Q1BV
cy4KPgo+IFBsZWFzZSBwcm92aWRlIHlvdXIgY29tbWVudHMgb3ZlciB0aGUgY2hhbmdlcyBkb25l
Lgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgKiBSZW5hbWVkIHRoZSByYl9ydW5xX2luc2VydAo+
ICAqIENvcnJlY3RlZCB0aGUgbmV4dCBwcm9iYWJsZSBydW5xIGVsZW1lbnQgZnJvbSByYl9maXJz
dCB0byByYl9sYXN0Cj4gICogSW50cm9kdWNlZCBuZXcgY2FjaGVkIGF0dHJpYnV0ZSB0byBoYXZl
IG5leHQgcnVucXVldWUgZW50cnkgY2FjaGVkCj4KPiByb290ICgyKToKPiAgIHhlbjogY3JlZGl0
MjogcmItdHJlZSBmb3IgcnVucXVldWVzCj4gICB4ZW46IGNyZWRpdDI6IGNhY2hlZCBhdHRyaWJ1
dGUgZm9yIG5leHQgcnVucXVldWUgZW50cnkKPgo+ICB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIu
YyB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQo+Cj4gLS0K
PiAyLjEzLjcKPgoKUGxlYXNlIHByb3ZpZGUgeW91ciBjb21tZW50cyBvbiB0aGUgY2hhbmdlcy4K
VGhhbmtzIGluIGFkdmFuY2UuCgpSZWdhcmRzLAoKflByYXZlZW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
