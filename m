From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
Date: Thu, 11 Apr 2019 14:19:06 +0100
Message-ID: <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YyQZ=SN=citrix.com=prvs=997b111c4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hEZfP-00037D-C3
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:22:59 +0000
In-Reply-To: <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMjAxOSAwNDoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gWGVuLCBodm1s
b2FkZXIgZmlybXdhcmUgbGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxlZCBmb3IKPiBlbnVt
ZXJhdGVkIFBDSSBkZXZpY2UgYmVmb3JlIGp1bXBpbmcgaW50byBPVk1GLiBPVk1GIHNlZW1zIHRv
Cj4gZXhwZWN0IGl0IHRvIGJlIGRpc2FibGVkIGFuZCB0cmllcyB0byBzaXplIFBDSSBCQVJzIGlu
IHNldmVyYWwgcGxhY2VzCj4gd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2VzIEJBUjY0
LCBmb3IgZXhhbXBsZSwgYmVpbmcKPiBpbmNvcnJlY3RseSBwbGFjZWQgYnkgUUVNVS4KPgo+IEZp
eCBpdCBieSBkaXNhYmxpbmcgUENJIGFkZHJlc3MgZGVjb2RpbmcgZXhwbGljaXRseSBiZWZvcmUg
dGhlCj4gZmlyc3QgYXR0ZW1wdCB0byBzaXplIEJBUnMgb24gWGVuLgoKVGhpcyBpcyBhbiBIVk1M
b2FkZXIgYnVnLCBzdXJlbHk/CgpXaHkgbm90IGZpeCBpdCBpbiBIVk1Mb2FkZXIgYnkgbm90IGVu
YWJsaW5nIG1lbW9yeSBkZWNvZGluZyBpbiB0aGUgZmlyc3QKcGxhY2UsIGFuZCBhdm9pZCBoYXZp
bmcgYm9vdHMgbm93IHRha2UgdHdvIHNldHMgb2YgZW11bGF0aW9ucyB0byBwbGF5CndpdGggbWVt
b3J5IGRlY29kaW5nLCB3aGVuIDAgd2lsbCBkbz8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
