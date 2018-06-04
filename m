From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/11] Fixes to debugging facilities
Date: Mon, 4 Jun 2018 16:39:29 +0100
Message-ID: <15dba408-9b01-f1ae-7f2e-51714b31d246@citrix.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDYvMTggMTQ6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gU28gdGhpcyBzdGFydGVk
IGFzIGEgc21hbGwgZml4IGZvciB0aGUgdm1lbnRyeSBmYWlsdXJlIChwZW51bHRpbWF0ZSBwYXRj
aCksCj4gYW5kIGhhcyBzbm93YmFsbGVkLi4uCj4KPiBJJ20gZmFpcmx5IGNvbmZpZGVudCB0aGF0
IGV2ZXJ5dGhpbmcgaW52b2x2aW5nIERFQlVHQ1RMLkJURiBpcyBicm9rZW4sIGFuZAo+IHRoZXJl
IGFyZSBkZWZpbml0ZWx5IGJ1Z3Mgd2l0aCBjb25maWd1cmluZyBERUJVR0NUTC5SVE0gKHdoaWNo
IHJlYWxseSBpc24ndAo+IGhlbHBlZCBieSB0aGUgZmFjdCB0aGF0IHRoZSBHQ0MgVFNYIGludHJp
bnNpY3MgcmVuZGVyIHRoZSByZXN1bHRpbmcgY29kZQo+IHVuLWRlYnVnZ2FibGUuKSAgSSdsbCBk
ZWZlciBmaXhpbmcgdGhlc2Ugc3dhbXBzIGZvciBub3cuCj4KPiBUaGUgZmlyc3QgNCBwYXRjaGVz
IHByb2JhYmx5IHdhbnQgYmFja3BvcnRpbmcgdG8gdGhlIHN0YWJsZSB0cmVlcywgc28gSSd2ZQo+
IHRha2VuIGNhcmUgdG8gbW92ZSB0aGVtIGFoZWFkIG9mIHBhdGNoIDYgZm9yIGJhY2twb3J0IHJl
YXNvbnMuICBXaGlsZSBhbGwKPiBmaXhlcyB3b3VsZCBpZGVhbGx5IGJlIGJhY2twb3J0ZWQsIEkg
Y2FuJ3QgZmluZCBhIHdheSBvZiBmaXhpbmcgJWRyNiBtZXJnaW5nCj4gKGFzIGl0IG5lZWRzIHRv
IGJlIGRvbmUgcHJlY2ljZWx5IG9uY2UpIHdpdGhvdXQgYSBiZWhhdmlvdXJhbCBjaGFuZ2UgaW4g
dGhlCj4gbW9uaXRvciBzdWJzeXN0ZW0uCj4KPiBQYXRjaCA4IHByb2JhYmx5IGJyZWFrcyBpbnRy
b3NwZWN0aW9uLCBzbyBjYW4ndCBiZSB0YWtlbiBhdCB0aGlzIHBvaW50LiAgU2VlCj4gdGhhdCBw
YXRjaCBmb3IgZGlzY3Vzc2lvbiBvZiB0aGUgcHJvYmxlbSBhbmQgbXkgYmVzdCBndWVzcyBhdCBh
IHNvbHV0aW9uLgoKQXMgc3BvdHRlZCBieSBSYXp2YW4sIEkgZm9yZ290IHRvIG1lbnRpb24gdGhh
dCB0aGlzIHNlcmllcyBpcyBidWlsdCBvbgp0b3Agb2YgIng4Ni92bXg6IEZpeCBoYW5kaW5nIG9m
IE1TUl9ERUJVR0NUTCBvbiBWTUV4aXQiLsKgIEl0IGNhbiBiZQpmb3VuZCBpbiBnaXQgZm9ybSBo
ZXJlOgoKaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2FuZHJld2Nvb3Av
eGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9kZWJ1Zy1maXhlcy12MQoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
