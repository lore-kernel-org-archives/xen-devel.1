From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/3] xen/swiotlb: simplify
 range_straddles_page_boundary()
Date: Tue, 23 Apr 2019 10:25:04 -0400
Message-ID: <799ae281-6a06-6a34-3bef-96b9fef8d1c2__2694.56751864112$1556029185$gmane$org@oracle.com>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMkX=SZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hIwG1-0008Om-2V
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 14:18:49 +0000
In-Reply-To: <20190423105457.17502-3-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: sstabellini@kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8xOSA2OjU0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IHJhbmdlX3N0cmFkZGxl
c19wYWdlX2JvdW5kYXJ5KCkgaXMgb3BlbiBjb2Rpbmcgc2V2ZXJhbCBtYWNyb3MgZnJvbQo+IGlu
Y2x1ZGUveGVuL3BhZ2UuaC4gVXNlIHRob3NlIGluc3RlYWQuIEFkZGl0aW9uYWxseSB0aGVyZSBp
cyBubyBuZWVkCj4gdG8gaGF2ZSBjaGVja19wYWdlc19waHlzaWNhbGx5X2NvbnRpZ3VvdXMoKSBh
cyBhIHNlcGFyYXRlIGZ1bmN0aW9uIGFzCj4gaXQgaXMgdXNlZCBvbmx5IG9uY2UsIHNvIG1lcmdl
IGl0IGludG8gcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkoKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
