From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 1/3] tools/libxencall: use hypercall
 buffer device if available
Date: Mon, 18 Jun 2018 12:26:25 +0100
Message-ID: <23335.38625.158272.413821@mariner.uk.xensource.com>
References: <20180618071856.25383-1-jgross@suse.com>
 <20180618071856.25383-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nblf=je=citrix.com=prvs=700d25f67=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fUsIn-0002wA-SV
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 11:26:29 +0000
In-Reply-To: <20180618071856.25383-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggdjIgMS8zXSB0b29scy9saWJ4ZW5jYWxsOiB1
c2UgaHlwZXJjYWxsIGJ1ZmZlciBkZXZpY2UgaWYgYXZhaWxhYmxlIik6Cj4gSW5zdGVhZCBvZiB1
c2luZyBhbm9ueW1vdXMgbWVtb3J5IGZvciBoeXBlcmNhbGwgYnVmZmVycyB3aGljaCBpcyB0aGVu
Cj4gbG9ja2VkIGludG8gbWVtb3J5LCB1c2UgdGhlIGh5cGVyY2FsbCBidWZmZXIgZGV2aWNlIG9m
IHRoZSBMaW51eAo+IHByaXZjbWQgZHJpdmVyIGlmIGF2YWlsYWJsZS4KPiAKPiBUaGlzIGhhcyB0
aGUgYWR2YW50YWdlIG9mIG5lZWRpbmcganVzdCBhIHNpbmdsZSBtbWFwKCkgZm9yIGFsbG9jYXRp
bmcKPiB0aGUgYnVmZmVyIGFuZCBwYWdlIG1pZ3JhdGlvbiBvciBjb21wYWN0aW9uIGNhbid0IG1h
a2UgdGhlIGJ1ZmZlcgo+IHVuYWNjZXNzaWJsZSBmb3IgdGhlIGh5cGVydmlzb3IuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
