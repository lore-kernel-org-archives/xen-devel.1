From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/5] xen/domain: Call
 lock_profile_deregister_struct() from common code
Date: Mon, 3 Sep 2018 17:56:39 +0100
Message-ID: <20180903165639.vnhhnttu5mbja57x@zion.uk.xensource.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1535986020-15906-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMDMsIDIwMTggYXQgMDM6NDY6NThQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBsb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KCkgaXMgY2FsbGVkIGZyb20gY29t
bW9uIGNvZGUsIGJ1dCB0aGUgbWF0Y2hpbmcKPiBkZXJlZ2lzdGVyIHdhcyBwcmV2aW91c2x5IG9u
bHkgY2FsbGVkIGZyb20geDg2IGNvZGUuCj4gCj4gVGhlIHByYWN0aWNhbCB1cHNob3Qgb2YgdGhp
cyB3aGVuIHVzaW5nIENPTkZJR19MT0NLX1BST0ZJTEUsIGRlc3Ryb3llZCBkb21haW5zCj4gb24g
QVJNIChhbmQgaW4gcGFydGljdWxhciwgdGhlIGZyZWVkIHBhZ2UgYmVoaW5kIHN0cnVjdCBkb21h
aW4pIHJlbWFpbiBvbiB0aGUKPiBsb2NrcHJvZmlsZSBsaW5rZWQgbGlzdCwgd2hpY2ggd2lsbCBi
ZWNvbWUgY29ycnVwdCB3aGVuIHRoZSBwYWdlIGlzIHJldXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
