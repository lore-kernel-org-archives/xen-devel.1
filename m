From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 1/3] Arm/atomic: unify generation of u64
 read/write functions
Date: Wed, 13 Mar 2019 10:16:09 +0000
Message-ID: <effe518d-282f-35b1-1fa3-fd24dc136599@arm.com>
References: <5C88D753020000780021E018@prv1-mh.provo.novell.com>
 <5C88D81F020000780021E029@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h40vl-0001s4-3r
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 10:16:13 +0000
In-Reply-To: <5C88D81F020000780021E029@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTMvMDMvMjAxOSAxMDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQnkgYWRk
aW5nIGFub3RoZXIgc3VpdGFibGUgYWJzdHJhY3RpbmcgbWFjcm8gdGhlIG5lZWQgZm9yIGV4cGxp
Y2l0Cj4gaW5saW5lIGZ1bmN0aW9uIGRlZmluaXRpb25zIGluIHRoZSAzMi1iaXQgY2FzZSBnb2Vz
IGF3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
