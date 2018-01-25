From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/2] xen: add
 acpi_arch_get_root_pointer() for pvh guests
Date: Thu, 25 Jan 2018 10:46:05 -0500
Message-ID: <b412ae20-76bf-854c-e69c-c74e876191e0__41391.3073869937$1516895127$gmane$org@oracle.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3nms=eu=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eejjH-0004jt-1p
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 15:46:19 +0000
In-Reply-To: <20180125143639.9969-3-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: rafael.j.wysocki@intel.com, mingo@redhat.com, stable@vger.kernel.org, lenb@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8yNS8yMDE4IDA5OjM2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEFkZCBhY3Bp
X2FyY2hfZ2V0X3Jvb3RfcG9pbnRlcigpIGZvciBYZW4gUFZIIGd1ZXN0cyB0byBjb21tdW5pY2F0
ZQo+IHRoZSBhZGRyZXNzIG9mIHRoZSBSU0RQIHRhYmxlIGdpdmVuIHRvIHRoZSBrZXJuZWwgdmlh
IFhlbiBzdGFydCBpbmZvLgo+IAo+IFRoaXMgbWFrZXMgdGhlIGtlcm5lbCBib290IGFnYWluIGlu
IFBWSCBtb2RlIGFmdGVyIG9uIHJlY2VudCBYZW4gdGhlCj4gUlNEUCB3YXMgbW92ZWQgdG8gaGln
aGVyIGFkZHJlc3Nlcy4gU28gdXAgdG8gdGhhdCBjaGFuZ2UgaXQgd2FzIHB1cmUKPiBsdWNrIHRo
YXQgdGhlIGxlZ2FjeSBtZXRob2QgdG8gbG9jYXRlIHRoZSBSU0RQIHdhcyB3b3JraW5nIHdoZW4K
PiBydW5uaW5nIGFzIFBWSCBtb2RlLgo+IAo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4g
IyA0LjExCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
ClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
