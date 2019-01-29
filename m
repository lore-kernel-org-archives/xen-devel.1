From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] libxl: correctly dispose of
 dominfo list in libxl_name_to_domid
Date: Tue, 29 Jan 2019 13:06:25 +0100
Message-ID: <6c3a1264-8768-4cf8-1891-92fec3001a20@suse.com>
References: <20190129113759.24272-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l94Z=QF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1goS9v-0001vQ-3S
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 12:06:31 +0000
In-Reply-To: <20190129113759.24272-1-wei.liu2@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDEvMjAxOSAxMjozNywgV2VpIExpdSB3cm90ZToKPiBUYW1hcyByZXBvcnRlZCBzc2lk
X2xhYmVsIHdhcyBsZWFrZWQuIFVzZSB0aGUgZGVzaWduYXRlZCBmdW5jdGlvbiB0bwo+IGZyZWUg
ZG9taW5mbyBsaXN0IHRvIGZpeCB0aGUgbGVha2FnZS4KPiAKPiBSZXBvcnRlZC1ieTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gVGVzdGVkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
