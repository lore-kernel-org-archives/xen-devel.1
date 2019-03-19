From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/paging: paging_set_allocation() is
 init-only
Date: Tue, 19 Mar 2019 17:00:38 +0000
Message-ID: <79fcdb57-9c76-1e92-f1d2-4a99b27a3a47@citrix.com>
References: <5C868F1E020000780021D5C1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nNMe=RW=citrix.com=prvs=974eac730=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h6I6i-0006HN-A9
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 17:00:56 +0000
In-Reply-To: <5C868F1E020000780021D5C1@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xMS8xOSA0OjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGlzIGlzIG5lZWRlZCBm
b3IgRG9tMCBjcmVhdGlvbiBvbmx5LCB0aGVyZWZvcmUgaXQgZ2V0cyBhZGRpdGlvbmFsbHkKPiBm
cmFtZWQgYnkgYW4gI2lmZGVmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
