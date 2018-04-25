From: Juergen Gross <jgross@suse.com>
Subject: Re: bogus wrap check in xen-netback
Date: Wed, 25 Apr 2018 09:28:38 +0200
Message-ID: <ec157759-b859-32e3-dc90-75fd8dce669d@suse.com>
References: <20180425091956.7e4c98bc.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ddll=ho=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBEr5-00012d-Ih
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 07:28:43 +0000
In-Reply-To: <20180425091956.7e4c98bc.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMTggMDk6MTksIE9sYWYgSGVyaW5nIHdyb3RlOgo+IFdpdGggY29tbWl0IDQ4ODU2
Mjg2YjY0ZSAoInhlbi9uZXRiYWNrOiBzaHV0ZG93biB0aGUgcmluZyBpZiBpdCBjb250YWlucyBn
YXJiYWdlLiIpIGEgbmV3IGNoZWNrIHdhcyBhZGRlZCB0byB4ZW4tbmV0YmFjaywgd2hpY2ggdHJp
Z2dlcnMgZm9yIG1lLgo+IAo+IFNpbmNlIHRoZXJlIGFyZSBidWdzIGluIHJpbmcgYnVmZmVyIGhh
bmRsaW5nIEkgdHJpZWQgdG8gdHJpZ2dlciB0aGVtIGVhcmxpZXIgYnkgY2hhbmdpbmcgUklOR19J
RFggZnJvbSB1MzIgdG8gdTE2LiBOb3cgSSBmb3VuZCBhbm90aGVyIG9uZSwgYW5kIEkgd29uZGVy
IGlmIHRoZSBlcnJvciBiZWxvdyBjb3VsZCBwb3RlbnRpYWxseSBhbHNvIGhpdCB3aXRoIHUzMjoK
PiAKPiAuLi4KPiBbICA2MjQuMTg2NDkyXSBicjA6IHBvcnQgMyh2aWYyLjApIGVudGVyZWQgZm9y
d2FyZGluZyBzdGF0ZQo+IFsgIDYyNC4xODY1MjJdIGJyMDogcG9ydCAzKHZpZjIuMCkgZW50ZXJl
ZCBmb3J3YXJkaW5nIHN0YXRlCj4gWyAgNjgwLjg2NTM5OF0gdmlmIHZpZi0xLTAgdmlmMS4wOiBJ
bXBvc3NpYmxlIG51bWJlciBvZiByZXF1ZXN0cy4gcmVxX3Byb2QgMCwgcmVxX2NvbnMgNjU0MDAs
IHNpemUgMjU2Cj4gWyAgNjgwLjg2NTQwMl0gdmlmIHZpZi0xLTAgdmlmMS4wOiBmYXRhbCBlcnJv
cjsgZGlzYWJsaW5nIGRldmljZQo+IFsgIDY4MC44NjU0OTVdIGJyMDogcG9ydCAyKHZpZjEuMCkg
ZW50ZXJlZCBkaXNhYmxlZCBzdGF0ZQo+IFsgIDY4OS40MzM4NDldIHZpZiB2aWYtMi0wIHZpZjIu
MDogSW1wb3NzaWJsZSBudW1iZXIgb2YgcmVxdWVzdHMuIHJlcV9wcm9kIDAsIHJlcV9jb25zIDY1
NTI3LCBzaXplIDI1Ngo+IFsgIDY4OS40MzM4NTddIHZpZiB2aWYtMi0wIHZpZjIuMDogZmF0YWwg
ZXJyb3I7IGRpc2FibGluZyBkZXZpY2UKPiBbICA2ODkuNDMzOTQ1XSBicjA6IHBvcnQgMyh2aWYy
LjApIGVudGVyZWQgZGlzYWJsZWQgc3RhdGUKPiBbICA2OTAuOTMwNTEyXSBwa3RnZW46IFBhY2tl
dCBHZW5lcmF0b3IgZm9yIHBhY2tldCBwZXJmb3JtYW5jZSB0ZXN0aW5nLiBWZXJzaW9uOiAyLjc1
Cj4gLi4uCj4gCj4gV2hhdCBleGFjdGx5IGlzIHRoYXQgY2hlY2sgaW4geGVudmlmX3R4X2J1aWxk
X2dvcHMgdHJ5aW5nIHRvIGFjaGlldmU/IFN1YnRyYWN0aW5nIGEgbm9uLXplcm8gdmFsdWUgZnJv
bSB6ZXJvIHdpbGwgYWx3YXlzIGNyZWF0ZSBzb21ldGhpbmcgbGFyZ2VyIHRoYW4gWEVOX05FVElG
X1RYX1JJTkdfU0laRS4KCldoeT8gKHUxNikwIC0gKHUxNik2NTQwMCA9PSAxMzYKCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
