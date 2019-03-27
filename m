From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 15:35:22 +0000
Message-ID: <580f684e-f93a-0a5b-d042-fb127cd5c183@citrix.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sq4U=R6=citrix.com=prvs=98279bc35=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h9Aaq-00082w-Ce
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 15:35:56 +0000
In-Reply-To: <20190318131155.29450-2-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xOC8xOSAxOjExIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IGNwdV9kaXNhYmxlX3Nj
aGVkdWxlcigpIGlzIGJlaW5nIGNhbGxlZCBmcm9tIF9fY3B1X2Rpc2FibGUoKSB0b2RheS4KPiBU
aGVyZSBpcyBubyBuZWVkIHRvIGNhbGwgaXQgb24gdGhlIGNwdSBqdXN0IGJlaW5nIGRpc2FibGVk
LCBzbyB1c2UKPiB0aGUgQ1BVX0RFQUQgY2FzZSBvZiB0aGUgY3B1IG5vdGlmaWVyIGNoYWluLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClNjaGVk
dWxlciBjaGFuZ2U6CgpBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
