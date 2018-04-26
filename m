From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 01/16] checkpatch: Add xendevicemodel_handle
 to the list of types
Date: Thu, 26 Apr 2018 15:34:00 +0100
Message-ID: <23265.58200.655918.190402@mariner.uk.xensource.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-2-git-send-email-ian.jackson@eu.citrix.com>
 <23265.45771.760936.993507@mariner.uk.xensource.com>
 <0b6d4152-f949-6c7a-6855-baa8e7124407@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBhyb-0000AQ-IH
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 14:34:25 +0000
In-Reply-To: <0b6d4152-f949-6c7a-6855-baa8e7124407@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

PiBJZiBubyBvbmUgaGFzIGNvbW1lbnRlZCBvbiB3aGF0IHNlZW1zIHByZXR0eSB0cml2aWFsIChl
c3BlY2lhbGx5IHNpbmNlCj4gY2hlY2twYXRjaC5wbCBoYXMgbm8gb2ZmaWNpYWwgbWFpbnRhaW5l
ciwgYnV0IGlzIG1vcmUgb2YgYQo+ICJ3aG9ldmVyLXRvdWNoZWQtaXQtbGFzdCIgZmlsZSBhdCB0
aGUgbW9tZW50KSwgdGhlbiBpbmNsdWRpbmcgdGhlIHBhdGNoCj4gaW4geW91ciBwdWxsIHJlcXVl
c3QgaXMgcGVyZmVjdGx5IGFjY2VwdGFibGUuICBBcyBhIG1haW50YWluZXIsIGl0IGlzCj4gYWxz
byBwZXJmZWN0bHkgYWNjZXB0YWJsZSBmb3IgeW91IHRvIGlnbm9yZSBmYWxzZSBwb3NpdGl2ZXMg
ZnJvbQo+IGNoZWNrcGF0Y2ggKGFsdGhvdWdoIGRvY3VtZW50aW5nIGl0IGluIHRoZSBjb21taXQg
bWVzc2FnZSBhbmQvb3IgY292ZXIKPiBsZXR0ZXIgbmV2ZXIgaHVydHMsIHdoZW4geW91IGFyZSBp
bnRlbnRpb25hbGx5IGlnbm9yaW5nIGEgZmFsc2UgcG9zaXRpdmUpLgoKVGhhbmtzIGZvciB0aGUg
Y29tcHJlaGVuc2l2ZSByZXNwb25zZS4KCj4gQnV0LCBhcyB0aGVyZSBoYXMgYWxzbyBiZWVuIGEg
cmVjZW50IHBhdGNoIHRvIHRlYWNoIGNoZWNrcGF0Y2ggYWJvdXQKPiBnbGliIHR5cGVzIFsxXSwg
eW91ciBwYXRjaCBtYWtlcyBzZW5zZSAoYW55IG1lcmdlIGNvbmZsaWN0IGJldHdlZW4geW91cgo+
IHBhdGNoIGFuZCB0aGF0IG9uZSB3aWxsIGJlIG9idmlvdXMgdG8gcmVzb2x2ZSkuICBTbyBvbiB0
aGF0IGdyb3VuZHMsCj4gCj4gUmV2aWV3ZWQtYnk6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQu
Y29tPgoKVGhhbmtzLgoKSSB3aWxsIHJlYmFzZSBvbnRvIGN1cnJlbnQgbWFzdGVyIGJlZm9yZSBz
ZW5kaW5nIGEgcHVsbCByZXF1ZXN0LCBzbwpJJ2xsIGdldCB0byByZXNvbHZlIHRoYXQgY29uZmxp
Y3QuCgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
