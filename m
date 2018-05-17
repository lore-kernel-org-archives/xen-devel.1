From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Thu, 17 May 2018 09:02:44 -0600
Message-ID: <5AFD999402000078001C3B29__27257.6680094518$1526569296$gmane$org@prv1-mh.provo.novell.com>
References: <20180517144723.21585-1-boris.ostrovsky@oracle.com>
 <20180517144723.21585-2-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtgu=ie=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJKQa-0007IB-NB
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 15:02:48 +0000
In-Reply-To: <20180517144723.21585-2-boris.ostrovsky@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE4IGF0IDE2OjQ3LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IEBAIC02NCw2ICs2Nyw5IEBAIEVOVFJZKHB2aF9zdGFydF94ZW4pCj4gIAltb3YgJWVh
eCwlZXMKPiAgCW1vdiAlZWF4LCVzcwo+ICAKPiArCW1vdiAkUFZIX0NBTkFSWV9TRUwsJWVheAo+
ICsJbW92ICVlYXgsJWdzCgpJIGRvdWJ0IHRoaXMgaXMgbmVlZGVkIGZvciA2NC1iaXQgKHlvdSBj
b3VsZCBlcXVhbGx5IHdlbGwgbG9hZCB6ZXJvIG9yIGxlYXZlCmluIHBsYWNlIHdoYXQncyB0aGVy
ZSBpbiB0aGF0IGNhc2UpLCBhbmQgbG9hZGluZyB0aGUgc2VsZWN0b3IgYmVmb3JlIHNldHRpbmcK
dGhlIGJhc2UgYWRkcmVzcyBpbiB0aGUgZGVzY3JpcHRvciB3b24ndCBoYXZlIHRoZSBpbnRlbmRl
ZCBlZmZlY3QuCgo+IEBAIC0xNTAsOSArMTcwLDEyIEBAIGdkdF9zdGFydDoKPiAgCS5xdWFkIEdE
VF9FTlRSWSgweGMwOWEsIDAsIDB4ZmZmZmYpIC8qIF9fS0VSTkVMX0NTICovCj4gICNlbmRpZgo+
ICAJLnF1YWQgR0RUX0VOVFJZKDB4YzA5MiwgMCwgMHhmZmZmZikgLyogX19LRVJORUxfRFMgKi8K
PiArCS5xdWFkIEdEVF9FTlRSWSgweDQwOTAsIDAsIDB4MTgpICAgIC8qIFBWSF9DQU5BUllfU0VM
ICovCj4gIGdkdF9lbmQ6Cj4gIAo+IC0JLmJhbGlnbiA0Cj4gKwkuYmFsaWduIDE2Cj4gK2NhbmFy
eToKPiArCS5maWxsIDI0LCAxLCAwCgpUaGlzIGlzIHRvbyBsaXR0bGUgc3BhY2UgZm9yIDY0LWJp
dCBhZmFpY3QgKHRoZSBjYW5hcnkgbGl2ZXMgYXQgb2Zmc2V0IDQwIHRoZXJlCmlmIEkgY2FuIHRy
dXN0IGFzbS9wcm9jZXNzb3IuaCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
