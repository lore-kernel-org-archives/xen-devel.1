From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.12] libxl: correctly dispose of
 dominfo list in libxl_name_to_domid
Date: Tue, 29 Jan 2019 13:35:43 +0000
Message-ID: <23632.22191.716464.795441@mariner.uk.xensource.com>
References: <20190129113759.24272-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoEg=QF=citrix.com=prvs=9252b1a92=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1goTYK-0002fS-Ty
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 13:35:48 +0000
In-Reply-To: <20190129113759.24272-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTJdIGxpYnhsOiBjb3JyZWN0bHkgZGlzcG9z
ZSBvZiBkb21pbmZvIGxpc3QgaW4gbGlieGxfbmFtZV90b19kb21pZCIpOgo+IFRhbWFzIHJlcG9y
dGVkIHNzaWRfbGFiZWwgd2FzIGxlYWtlZC4gVXNlIHRoZSBkZXNpZ25hdGVkIGZ1bmN0aW9uIHRv
Cj4gZnJlZSBkb21pbmZvIGxpc3QgdG8gZml4IHRoZSBsZWFrYWdlLgo+IAo+IFJlcG9ydGVkLWJ5
OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBUZXN0ZWQtYnk6IFRhbWFzIEsgTGVuZ3ll
bCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KCj4gQmFja3BvcnQgY2FuZGlkYXRlLgoKTm90ZWQuCgpUaGFua3Ms
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
