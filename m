From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 3/5] xen/domain: Move guest type checks
 into the arch_sanitise_domain_config() path
Date: Wed, 14 Nov 2018 18:52:19 +0000
Message-ID: <98d676c9-ad5a-38be-fe99-225ac8b5fe6d@arm.com>
References: <1542039391-32406-4-git-send-email-andrew.cooper3@citrix.com>
 <1542217484-11659-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542217484-11659-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNC8xMS8yMDE4IDE3OjQ0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoaXMgaXMg
YSBtb3JlIGFwcHJvcHJpYXRlIGxvY2F0aW9uIGZvciB0aGUgY2hlY2tzIHRvIGhhcHBlbiwgYW5k
IGNsZWFucyB1cAo+IHRoZSBjb21tb24gY29kZSBzdWJzdGFudGlhbGx5Lgo+IAo+IFRha2UgdGhl
IG9wcG9ydHVuaXR5IHRvIG1ha2UgQVJNIHN0cmljdGx5IHJlcXVpcmUgSFZNfEhBUCBmb3IgZ3Vl
c3RzLCB3aGljaCBpcwo+IGhvdyB0aGUgdG9vbHN0YWNrIGJlaGF2ZXMsIGFuZCBsZWF2ZSBhIGRw
cmludGsoKSBiZWhpbmQgZm9yIGF1ZGl0aW5nIGZhaWx1cmVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpJIGRpZG4ndCBzcG90
IHlvdSBzZW50IGEgbmV3IHZlcnNpb24uIFNvIGFkZGluZyBteSBhY2sgaGVyZToKCkFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
