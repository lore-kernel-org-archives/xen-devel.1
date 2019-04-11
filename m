From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
Date: Thu, 11 Apr 2019 17:51:23 +0100
Message-ID: <e5f75fb1-daec-5e5d-cfd6-ac498455a042@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
 <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
 <027594a1-b35b-3624-8fe1-10a46301198f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V9MO=SN=citrix.com=prvs=99793e752=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hEcw8-0003T7-3g
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 16:52:28 +0000
In-Reply-To: <027594a1-b35b-3624-8fe1-10a46301198f@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMjAxOSAxNToxMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTEvMDQvMjAx
OSAxNDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMDQvMjAxOSAwNDoxMiwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBPbiBYZW4sIGh2bWxvYWRlciBmaXJtd2FyZSBsZWF2ZXMg
YWRkcmVzcyBkZWNvZGluZyBlbmFibGVkIGZvcgo+Pj4gZW51bWVyYXRlZCBQQ0kgZGV2aWNlIGJl
Zm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZNRiBzZWVtcyB0bwo+Pj4gZXhwZWN0IGl0IHRvIGJl
IGRpc2FibGVkIGFuZCB0cmllcyB0byBzaXplIFBDSSBCQVJzIGluIHNldmVyYWwgcGxhY2VzCj4+
PiB3aXRob3V0IGRpc2FibGluZyBpdCB3aGljaCBjYXVzZXMgQkFSNjQsIGZvciBleGFtcGxlLCBi
ZWluZwo+Pj4gaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCj4+Pgo+Pj4gRml4IGl0IGJ5IGRp
c2FibGluZyBQQ0kgYWRkcmVzcyBkZWNvZGluZyBleHBsaWNpdGx5IGJlZm9yZSB0aGUKPj4+IGZp
cnN0IGF0dGVtcHQgdG8gc2l6ZSBCQVJzIG9uIFhlbi4KPj4KPj4gVGhpcyBpcyBhbiBIVk1Mb2Fk
ZXIgYnVnLCBzdXJlbHk/Cj4gCj4gSSdsbCB0cnkgdG8gdHVybiBpdCBvZmYgaW4gSFZNTG9hZGVy
IGJ1dCBJJ20gbm90IHN1cmUgb3RoZXIgQklPU2VzIHdvdWxkCj4gbGlrZSBpdC4gQWx0aG91Z2gg
dGhleSBzaG91bGQgbm90IG1ha2UgYW55IGFzc3VtcHRpb25zIG9uIHdoZXRoZXIgbWVtb3J5Cj4g
ZGVjb2RpbmcgaXMgZW5hYmxlZCBvciBub3QgKHNvIGFzIE9WTUYgLSBoZW5jZSB0aGlzIHBhdGNo
KSBpdCdzIHN0aWxsCj4gcmlza3kgZnJvbSBteSBwb2ludCBvZiB2aWV3LgoKSGF2aW5nIHRlc3Rl
ZCBST01CSU9TIGFuZCBTZWFCSU9TIC0gbm9uZSBvZiB0aGVtIHdvcmtlZCB3aXRob3V0Cmh2bWxv
YWRlciBlbmFibGluZyBkZWNvZGluZy4gV2hpbGUgaXQgc2VlbXMgd3JvbmcgLSB0aGV5IG9idmlv
dXNseQpwbGFndWVkIGJ5IHRoZSBzYW1lIGFzc3VtcHRpb24gb24gc3lzdGVtIHN0YXRlIGFzIE9W
TUYuIFRoaXMgcGF0Y2gKYWRkcmVzc2VzIHRoZSBpc3N1ZSBpbiBPVk1GIGFuZCBJIHRoaW5rIHRo
YXQncyBjb3JyZWN0LiBBZGRyZXNzaW5nIHRoZQppc3N1ZSBpbiBvdGhlciBCSU9TZXMgbWlnaHQg
YmUgY29uc2lkZXJlZCBhbiBpbXByb3ZlbWVudCBmb3IgdGhlIGZ1dHVyZS4KCklnb3IKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
