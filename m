From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v2 0/3] Xen PCI passthrough fixes
Date: Tue, 9 Apr 2019 09:54:55 +0200
Message-ID: <fb066d31-18fb-c0de-c2f2-814423664071@redhat.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2Q/q=SL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hDlau-00050w-1v
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 07:55:00 +0000
In-Reply-To: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, edk2-devel-groups-io <devel@edk2.groups.io>, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgSWdvciwKCk9uIDA0LzA5LzE5IDA1OjEyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPiBJZ29y
IERydXpoaW5pbiAoMyk6Cj4gICBPdm1mUGtnL1hlblN1cHBvcnQ6IHJlbW92ZSB1c2FnZSBvZiBw
cmVmZXRjaGFibGUgUENJIGhvc3QgYnJpZGdlCj4gICAgIGFwZXJ0dXJlCj4gICBPdm1mUGtnL1hl
blN1cHBvcnQ6IHVzZSBhIGNvcnJlY3QgUENJIGhvc3QgYnJpZGdlIGFwZXJ0dXJlIGZvciBCQVI2
NAo+ICAgT3ZtZlBrZy9YZW5TdXBwb3J0OiB0dXJuIG9mZiBhZGRyZXNzIGRlY29kaW5nIGJlZm9y
ZSBCQVIgc2l6aW5nCj4gCj4gIE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1
cHBvcnQuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMzcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKCnNvbWUgZ2VuZXJhbCBhZG1p
bmlzdHJhdGl2YToKCigxKSB0aGUgZWRrMi1kZXZlbCBtYWlsaW5nIGxpc3QgaGFzIG1vdmVkLiBQ
bGVhc2Ugc3Vic2NyaWJlIGF0CjxodHRwczovL2VkazIuZ3JvdXBzLmlvL2cvZGV2ZWw+LCBhbmQg
cmVzZW5kIHRoZSBzZXJpZXMuIEFwb2xvZ2llcyBhYm91dAp0aGUgaW5jb252ZW5pZW5jZS4KCigy
KSBCeSB0aGUgdGltZSB3ZSBwdXNoIHRoaXMgc2VyaWVzLAo8aHR0cHM6Ly9idWd6aWxsYS50aWFu
b2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzczPiB3aWxsIGhhdmUgYmVlbgpmaXhlZCBtb3N0
IGxpa2VseS4gVGhhdCBtZWFucyB0aGF0IHlvdSB3aWxsIG5vIGxvbmdlciBuZWVkIHRvIGFkZCB0
aGUKIkNvbnRyaWJ1dGVkLXVuZGVyIiBsaW5lIHRvIHlvdXIgc2lnbm9mZnMsIG9uIGFsbCBwYXRj
aGVzLgoKVGhhbmtzIQpMYXN6bG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
