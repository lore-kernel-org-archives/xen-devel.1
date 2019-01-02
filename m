From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: get_reaper_lock_and_uid: Document fd
 handling
Date: Wed, 2 Jan 2019 14:02:06 +0000
Message-ID: <20190102140206.h4pd2325gnpxucoc@zion.uk.xensource.com>
References: <20190102120343.21267-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1geh64-00007l-0t
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 14:02:12 +0000
Content-Disposition: inline
In-Reply-To: <20190102120343.21267-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMDIsIDIwMTkgYXQgMTI6MDM6NDNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQ292ZXJpdHkgdW5kZXJzdGFuZGFibHkgY29tcGxhaW5zIHRoYXQgZ2V0X3JlYXBlcl9s
b2NrX2FuZF91aWQgbGVha3MKPiB0aGUgZmQgYW5kIGhlbmNlIG9wZW4tZmlsZS4gIEJ1dCB0aGlz
IGlzIGludGVudGlvbmFsOiB0aGUgbG9jayBiZWNvbWVzCj4gb3duZWQgYnkgdGhlIGNoaWxkIHBy
b2Nlc3MgYXMgYSB3aG9sZSwgd2hpY2ggaXMgZW50aXJlbHkgdGhlIHByb3BlcnR5Cj4gb2YgbGli
eGwuCj4gCj4gKFRoZSBjb2Rpbmcgc3R5bGUgaGVyZSBpbiB0aGlzIHN1YnByb2Nlc3MgaXMgYSBi
aXQgYW5vbWFsb3VzIGJ1dCBpdCdzCj4gcHJvYmFibHkgbm90IHdvcnRoIGl0IHRvIGNvbnZlcnQg
Z2V0X3JlYXBlcl9sb2NrX2FuZF91aWQgdG8gYGdvdG8gb3V0Jwo+IHN0eWxlIGFuZCBoYXZlIGl0
IGV4cGxpY2l0bHkgcmV0dXJuIHRoZSBmZCBudW1iZXIuKQo+IAoKQ292ZXJpdHktSUQ6IFhYWFgg
aGVyZT8KCj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
