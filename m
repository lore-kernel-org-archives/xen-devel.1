From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/4] x86/mm: drop redundant local variable
 from _get_page_type()
Date: Fri, 5 Apr 2019 11:37:49 +0100
Message-ID: <03a56f31-8634-75fc-d432-ec755587aa29@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9DE020000780021E17D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWJI=SH=citrix.com=prvs=991202d17=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hCMEN-0005Bz-Ln
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:37:55 +0000
In-Reply-To: <5C88F9DE020000780021E17D@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMy8xOSAxMjozOCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5zdGVhZCBvZiB0aGUg
c2VwYXJhdGUgaW9tbXVfcmV0LCB0aGUgZ2VuZXJhbCByYyBjYW4gYmUgdXNlZCBldmVuIGZvcgo+
IHRoZSBJT01NVSBvcGVyYXRpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
