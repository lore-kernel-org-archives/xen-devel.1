From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: extract and save affinity maps from
 hypervisor
Date: Tue, 16 Oct 2018 18:44:02 +0100
Message-ID: <23494.9058.115538.263269@mariner.uk.xensource.com>
References: <409d6789ab39c20d3c90483426e6d146ad131de1.1537546261.git-series.wei.liu2@citrix.com>
 <23494.4470.855127.777529@mariner.uk.xensource.com>
 <6eee6a89df54025bb4316a917a67b60840026725.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b3lb=m4=citrix.com=prvs=820ed1191=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gCTOE-0002kQ-OG
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 17:44:18 +0000
In-Reply-To: <6eee6a89df54025bb4316a917a67b60840026725.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGFyaW8gRmFnZ2lvbGkgd3JpdGVzICgiUmU6IFtQQVRDSF0gbGlieGw6IGV4dHJhY3QgYW5kIHNh
dmUgYWZmaW5pdHkgbWFwcyBmcm9tIGh5cGVydmlzb3IiKToKPiBJZiBvbiB0aGUgb3RoZXIgaGFu
ZCwgYSBkb21haW4gd2FzIGFjdHVhbGx5IGV4cGxpY2l0bHkgc3BlY2lmaWVkLCB0aGVuCj4gSSBn
dWVzcyBpdCBtYWtlcyBzZW5zZSB0byBhdCBsZWFzdCB0cnkgdG8gc2V0IGl0IHdoZW4gcmVzdW1p
bmcuCj4gCj4gU28gdGhlIHBvaW50IGlzLCBhcmUgd2UsIGF0IHRoYXQgdGltZSAoaS5lLiwgZHVy
aW5nIHJlc3VtZSksIGFibGUgdG8KPiB0ZWxsIHdoZXRoZXIgdGhlIHJlYXNvbiB3aHkgdGhlIGRv
bWFpbiBoYXMgYW4gYWZmaW5pdHksIGlzIGJlY2F1c2UgdGhlCj4gdXNlciBleHBsaWNpdGx5IHNw
ZWNpZmllZCBpdD8gT3V0IG9mIHRoZSB0b3Agb2YgbXkgaGVhZCwgSSBkb24ndCB0aGluawo+IHdl
IGNhbiwgYnV0IEkgcHJvYmFibHkgYmV0dGVyIGhhdmUgYW5vdGhlciBsb29rIGF0IHRoZSBjb2Rl
IHRvbW9ycm93Li4uCj4gOi0vCgpTbyBJIHRoaW5rIHdoYXQgaXMgbmVlZGVkIGlzIHRvIHNhdmUg
dGhlIG9yaWdpbmFsIGNvbmZpZy1zcGVjaWZpZWQKYWZmaW5pdHkgKHBsdXMgYW55IHVwZGF0ZXMp
LCBub3QgZmlzaCB0aGUgKHByb2JhYmx5IGxpYnhsLWdlbmVyYXRlZCkKb25lIG91dCBvZiB0aGUg
aHlwZXJ2aXNvci4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
