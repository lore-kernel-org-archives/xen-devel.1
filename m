From: Pavel Tatashin <pasha.tatashin@oracle.com>
Subject: Re: [v1 1/1] xen,
	mm: Allow deferred page initialization for xen pv domains
Date: Mon, 26 Feb 2018 08:39:54 -0500
Message-ID: <CAOAebxt6CtQYQ5MxOrpyrLdVapPnw3XePTWUAz1SGuRoukaNGA@mail.gmail.com>
References: <20180223232538.4314-1-pasha.tatashin@oracle.com>
 <20180223232538.4314-2-pasha.tatashin@oracle.com>
 <dda0457a-c16a-3440-a547-15f49e52ec95@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mzkt=fu=oracle.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1eqJ0d-0001Vn-Uw
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 13:40:04 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w1QDanDQ031116
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 13:39:57 GMT
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
 by userp2120.oracle.com with ESMTP id 2gcjca8886-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 13:39:57 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w1QDdt7n004900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 13:39:56 GMT
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w1QDdtAM005754
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 13:39:55 GMT
Received: by mail-ot0-f171.google.com with SMTP id n74so13166917ota.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 05:39:55 -0800 (PST)
In-Reply-To: <dda0457a-c16a-3440-a547-15f49e52ec95@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Michal Hocko <mhocko@suse.com>, virtualization@lists.linux-foundation.org, Linux Memory Management List <linux-mm@kvack.org>, Steve Sistare <steven.sistare@oracle.com>, hpa@zytor.com, dan.j.williams@intel.com, bhe@redhat.com, x86@kernel.org, akataria@vmware.com, Daniel Jordan <daniel.m.jordan@oracle.com>, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, minipli@googlemail.com, jinb.park7@gmail.com, Andy Lutomirski <luto@kernel.org>, boris.ostrovsky@oracle.com, Vlastimil Babka <vbabka@suse.cz>, labbott@redhat.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, zhang.jia@linux.alibaba.com, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

SGkgSnVlcmdlbiwKClRoYW5rIHlvdSBmb3IgdGFraW5nIGEgbG9vayBhdCB0aGlzIHBhdGNoLCBJ
IHdpbGwgYWRkcmVzcyB5b3VyCmNvbW1lbnRzLCBhbmQgc2VuZCBvdXQgYW4gdXBkYXRlZCBwYXRj
aC4KCj4+ICBleHRlcm4gdm9pZCBkZWZhdWx0X2Jhbm5lcih2b2lkKTsKPj4KPj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBwYXJhdmlydF9hZnRlcl9ib290bWVtKHZvaWQpCj4+ICt7Cj4+ICsgICAgIHB2
X2luaXRfb3BzLmFmdGVyX2Jvb3RtZW0oKTsKPj4gK30KPj4gKwo+Cj4gUHV0dGluZyB0aGlzIGlu
IHRoZSBwYXJhdmlydCBmcmFtZXdvcmsgaXMgb3ZlcmtpbGwgSU1PLiBUaGVyZSBpcyBubyBuZWVk
Cj4gdG8gcGF0Y2ggdGhlIGNhbGxzaXRlcyBmb3Igb3B0aW1hbCBwZXJmb3JtYW5jZS4KPgo+IEkn
ZCBwdXQgaXQgaW50byBzdHJ1Y3QgeDg2X2h5cGVyX2luaXQgYW5kIHByZS1pbml0IGl0IHdpdGgg
eDg2X2luaXRfbm9vcAoKU3VyZSwgSSB3aWxsIG1vdmUgaXQgaW50byB4ODZfaHlwZXJfaW5pdC4K
Cj4+Cj4+ICsvKgo+PiArICogRHVyaW5nIGVhcmx5IGJvb3QgYWxsIHBhZ2VzIGFyZSBwaW5uZWQs
IGJ1dCB3ZSBkbyBub3QgaGF2ZSBzdHJ1Y3QgcGFnZXMsCj4+ICsgKiBzbyByZXR1cm4gdHJ1ZSB1
bnRpbCBzdHJ1Y3QgcGFnZXMgYXJlIHJlYWR5Lgo+PiArICovCj4KPiBVdWgsIHRoaXMgY29tbWVu
dCBpcyBqdXN0IG5vdCB0cnVlLgo+Cj4gVGhlICJwaW5uZWQiIHN0YXRlIGZvciBYZW4gbWVhbnMg
aXQgaXMgYSBwdiBwYWdldGFibGUga25vd24gdG8gWGVuLiBTdWNoCj4gcGFnZXMgYXJlIHJlYWQt
b25seSBmb3IgdGhlIGd1ZXN0IGFuZCBjYW4gYmUgbW9kaWZpZWQgdmlhIGh5cGVyY2FsbHMKPiBv
bmx5Lgo+Cj4gU28gZWl0aGVyIHRoZSAicGlubmVkIiBzdGF0ZSB3aWxsIGJlIHRlc3RlZCBmb3Ig
cGFnZSB0YWJsZXMgb25seSwgaW4KPiB3aGljaCBjYXNlIHRoZSBjb21tZW50IG5lZWRzIGFkanVz
dG1lbnQsIG9yIHRoZSBjb2RlIGlzIHdyb25nLgoKVGhlIGNvbW1lbnQgc2hvdWxkIHN0YXRlOiBE
dXJpbmcgZWFybHkgYm9vdCBhbGwgX3BhZ2UgdGFibGVfIHBhZ2VzIGFyZSBwaW5uZWQKClRoYW5r
IHlvdSwKUGF2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
