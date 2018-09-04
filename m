From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 01/23] x86: change name of parameter for
 various invlpg functions
Date: Tue, 4 Sep 2018 09:42:49 -0400
Message-ID: <f933b8db-81ec-5b39-b686-dabfff1618cf@oracle.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <ae822cd4b618fc4078e137cf69f6827f1647752c.1535285866.git-series.wei.liu2@citrix.com>
 <20180903134644.s6ddvd57eluw72pi@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5ckp=ls=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fxBbk-0006kh-Mu
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 13:43:04 +0000
In-Reply-To: <20180903134644.s6ddvd57eluw72pi@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8wMy8yMDE4IDA5OjQ2IEFNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFN1biwgQXVnIDI2
LCAyMDE4IGF0IDAxOjE5OjM0UE0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4+IFRoZXkgYWxsIGlu
Y29ycmVjdGx5IG5hbWVkIGEgcGFyYW1ldGVyIHZpcnR1YWwgYWRkcmVzcyB3aGlsZSBpdCBzaG91
bGQKPj4gaGF2ZSBiZWVuIGxpbmVhciBhZGRyZXNzLgo+Pgo+PiBSZXF1ZXN0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gSXMgdGhlcmUgbW9yZSBjb21tZW50IG9uIHRo
aXM/Cj4KPiBUaGVzZSBiZWluZyByYXRoZXIgbWVjaGFuaWNhbCBjaGFuZ2VzIG1ha2VzIG1lIHdv
bmRlciBpZiBJIHNob3VsZCB3YWl0Cj4gdG8gY29sbGVjdCBhbGwgbmVjZXNzYXJ5IGFjay9yZXZp
ZXcgb3IganVzdCBnbyBhaGVhZCB3aXRoIEphbiBhbmQKPiBLZXZpbidzLgoKCkFzIEkgc2FpZCBl
YXJsaWVyLCBJIGFtIG5vdCBjb252aW5jZWQgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5IHNpbmNl
IEFNRCAKZGVmaW5lcyB2aXJ0dWFsIGFuZCBsaW5lYXIgYWRkcmVzc2VzIGFzIHN5bm9ueW1zIChz
ZWUsIGZvciBleGFtcGxlLCAKc2VjdGlvbiAxLjEuMS4gaW4gdm9sdW1lIDIpLgoKSG93ZXZlciwg
aWYgb3RoZXJzIHRoaW5rIGxpbmVhciBpcyBhIGJldHRlciB0ZXJtIHRvIHVzZSwgdGhhdCdzIGZp
bmUgdG9vLgoKQWNrZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
