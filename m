From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] arm,
 smmu: backport "Disable stalling faults for all endpoints"
Date: Tue, 30 Oct 2018 03:20:14 -0600
Message-ID: <5BD8224E02000078001F628B@prv1-mh.provo.novell.com>
References: <1540847646-13676-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgbc=nk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHQCC-00009a-2P
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 09:20:20 +0000
In-Reply-To: <1540847646-13676-1-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjEwLjE4IGF0IDIyOjE0LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IAo+IEJh
Y2twb3J0IGNvbW1pdCAzNzE0Y2UxZDY2NTUwOThlZTY5ZWRlNjMyODgzZTU4NzRkNjdlNGFiCj4g
ImlvbW11L2FybS1zbW11OiBEaXNhYmxlIHN0YWxsaW5nIGZhdWx0cyBmb3IgYWxsIGVuZHBvaW50
cyIgZnJvbSB0aGUKPiBMaW51eCBrZXJuZWwuIFRoaXMgd29ya3MtYXJvdW5kIEVycmF0dW0gIzg0
Mjg2OS4KCkJ0dywgc2VlaW5nIHRoaXMgaGF2aW5nIGdvbmUgaW4gYSBmZXcgaG91cnMgYWdvIEkg
Z290IHJhdGhlciBwdXp6bGVkCmJ5IHRoZXJlIGJlaW5nIGEgYmFja3BvcnQgb24gdGhlIG1hc3Rl
ciBicmFuY2guIEluIHRoZSBmdXR1cmUsIGNhbgpzdWNoIGJlIHRpdGxlZCBqdXN0ICJwb3J0IC4u
LiIgYXMgdGhleSdyZSBub3QgcmVhbGx5IGJhY2twb3J0cyAod2hpY2gKd291bGQgaW1wbHkgYSB2
YXJpYW50IGJlaW5nIGF2YWlsYWJsZSBvbiBhIG5ld2VyIGJyYW5jaCk/CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
