From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/timers: Fix memory leak with cpu
 unplug/plug (take 2)
Date: Thu, 25 Apr 2019 06:44:09 -0600
Message-ID: <5CC1AB9902000078002290CE@prv1-mh.provo.novell.com>
References: <1556034593-3692-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdjd-0002af-27
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:44:17 +0000
In-Reply-To: <1556034593-3692-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE5IGF0IDE3OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUHJldmlvdXMgYXR0ZW1wdHMgdG8gZml4IHRoaXMgbGVhayBmYWlsZWQgdG8gaWRlbnRp
ZnkgdGhlIHJvb3QgY2F1c2UsIGFuZAo+IHVsdGltYXRlbHkgZmFpbGVkLiAgVGhlIGNhdXNlIGlz
IHRoZSBDUFVfVVBfUFJFUEFSRSBjYXNlIChyZSlpbml0aWFsaXNpbmcKPiB0cy0+aGVhcCBiYWNr
IHRvIGR1bW15X2hlYXAsIHdoaWNoIGxlYWtzIHRoZSBwcmV2aW91cyBhbGxvY2F0aW9uLgo+IAo+
IFJlYXJyYW5nZSB0aGUgbG9naWMgdG8gb25seSBpbml0aWFsaXNlIHRzIG9uY2UuICBUaGlzIGFs
c28gYXZvaWRzIHRoZQo+IHJlZHVuZGFudCAoYnV0IGJlbmlnbiwgZHVlIHRvIHRzLT5pbmFjdGl2
ZSBhbHdheXMgYmVpbmcgZW1wdHkpIGluaXRpYWxpc2luZyBvZgo+IHRoZSBvdGhlciB0cyBmaWVs
ZHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
