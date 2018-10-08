From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 00/18] Miscellaneous build and docs,
 fixes from Debian
Date: Mon, 8 Oct 2018 15:28:32 +0100
Message-ID: <23483.27024.387818.306401@mariner.uk.xensource.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w/aj=mu=citrix.com=prvs=812085e53=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g9WWl-0001XR-Ff
 for xen-devel@lists.xenproject.org; Mon, 08 Oct 2018 14:28:55 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Shriram Rajagopalan <rshriram@cs.ubc.ca>, Yang Hongyang <imhy.yang@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>, Meng  Xu <mengxu@cis.upenn.edu>, Kevin Tian <kevin.tian@intel.com>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Hans van  Kranenburg <hans@knorrie.org>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIDAwLzE4XSBNaXNjZWxsYW5lb3VzIGJ1aWxkIGFu
ZCBkb2NzLCBmaXhlcyBmcm9tIERlYmlhbiIpOgo+IEJhc3RpYW4gQmxhbmsgKDEpOgo+IElhbiBK
YWNrc29uICgxNyk6CgpUaGFua3MgdG8gdGhlIHJldmlld2Vycy4gIEkgaGF2ZSBwdXNoZWQgdG8g
c3RhZ2luZyB0aGVzZSBwYXRjaGVzLAp3aGljaCB3ZXJlIGFja2VkL3Jldmlld2VkIGFuZCBzZWVt
ZWQgdG8gbWUgdG8gYmUgdW5jb250cm92ZXJzaWFsOgoKPiAgIGRvY3MvbWFuOiBGaXggdHdvIHR5
cG9zIGRldGVjdGVkIGJ5IHRoZSBEZWJpYW4gbGludGlhbiB0b29sCj4gICB0b29scy94ZW50cmFj
ZS94ZW5hbHl6ZTogRml4IHR5cG9zIGRldGVjdGVkIGJ5IGxpbnRpYW4KPiAgIFZhcmlvdXM6IEZp
eCB0eXBvcyBgdW5rb3duJywgYHJldHJlaXZlJyAoZGV0ZWN0ZWQgYnkgbGludGlhbikKPiAgIFZh
cmlvdXM6IEZpeCB0eXBvIGBvY2N1cmVkJwo+ICAgVmFyaW91czogRml4IHR5cG8gYHJlc2V0aW5n
Jwo+ICAgdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbDogRml4IHR5cG8gYHN1Y2VzcycKPiAgIFZh
cmlvdXM6IEZpeCB0eXBvIGBpbmZvbWF0aW9uJwo+ICAgVmFyaW91czogRml4IHR5cG8gYG1hcHBw
aW5nJwo+ICAgZG9jcy9tYW46IFByb3ZpZGUgcHJvcGVybHktZm9ybWF0dGVkIE5BTUUgc2VjdGlv
bnMKPiAgIGRvY3MvbWFuL3hlbi1wdi1jaGFubmVsLnBvZC43OiBSZW1vdmUgYSBzcHVyaW91cyBi
bGFuayBsaW5lCj4gICB0b29scy94ZW5zdGF0OiBGaXggc2hhcmVkIGxpYnJhcnkgdmVyc2lvbgo+
ICAgbGliZnNpbWFnZTogSG9ub3VyIGdlbmVyYWwgTERGTEFHUwoKU3ViamVjdCB0byBmdXJ0aGVy
IGNvbW1lbnRzLCBJIHdpbGwgcmVwb3N0IHRoZSByZW1haW5kZXIgYXMgYSB2MiBvZgp0aGUgc2Vy
aWVzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
