From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/spec_ctrl: Fix several bugs in
 SPEC_CTRL_ENTRY_FROM_INTR_IST
Date: Wed, 14 Feb 2018 11:46:55 +0000
Message-ID: <20180214114655.miepplm4sfh6n57a@citrix.com>
References: <1518606655-787-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1518606655-787-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMTQsIDIwMTggYXQgMTE6MTA6NTVBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBET19PVkVSV1JJVEVfUlNCIGNsb2JiZXJzICVyYXgsIG1lYW5pbmcgaW4gcHJhY3Rp
Y2UgdGhhdCB0aGF0IHRoZSBidGlfaXN0X2luZm8KPiBmaWVsZCBnZXRzIHplcm9lZC4gIE9sZGVy
IHZlcnNpb25zIG9mIHRoaXMgY29kZSBoYWQgdGhlIERPX09WRVJXUklURV9SU0IKPiByZWdpc3Rl
ciBzZWxlY3RhYmxlLCBzbyByZWludHJvZHVjZSB0aGlzIGFiaWxpdHkgYW5kIHVzZSBpdCB0byBj
YXVzZSB0aGUKPiBJTlRSX0lTVCBwYXRoIHRvIHVzZSAlcmR4IGluc3RlYWQuCj4gCj4gVGhlIHVz
ZSBvZiAlZGwgZm9yIHRoZSAlY3MucnBsIGNoZWNrIG1lYW5zIHRoYXQgd2hlbiBhbiBJU1QgaW50
ZXJydXB0IGhpdHMKPiBYZW4sIHdlIHRyeSB0byBsb2FkIDEgaW50byB0aGUgaGlnaCAzMiBiaXRz
IG9mIE1TUl9TUEVDX0NUUkwsIHN1ZmZlcmluZyBhICNHUAo+IGZhdWx0IGluc3RlYWQuCj4gCj4g
QWxzbywgZHJvcCBhbiB1bnVzZWQgbGFiZWwgd2hpY2ggd2FzIGEgY29weS9wYXN0ZSBtaXN0YWtl
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgo+IFJlcG9ydGVkLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3Jh
Y2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
