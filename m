From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/3] x86/svm: correct EFER.SVME intercept
	checks
Date: Sat, 3 Feb 2018 12:15:42 -0500
Message-ID: <a3fbe0dd-0038-eecd-3fd9-0198f61066f4@oracle.com>
References: <20180131203525.21660-1-brian.woods@amd.com>
 <20180131203525.21660-4-brian.woods@amd.com>
 <3afd1271-ae0c-7d44-0afe-0474c86b568c@oracle.com>
 <b79c8792-0b4a-8ad4-52cd-ea0b7e4c23c7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b79c8792-0b4a-8ad4-52cd-ea0b7e4c23c7@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
Cc: Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8wMy8yMDE4IDEyOjEwIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDAzLzAy
LzE4IDE3OjAzLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDAxLzMxLzIwMTgg
MDM6MzUgUE0sIEJyaWFuIFdvb2RzIHdyb3RlOgo+Pj4gQ29ycmVjdHMgc29tZSBFRkVSLlNWTUUg
Y2hlY2tzIGluIGludGVyY2VwdHMuwqAgU2VlIEFNRCBBUE0gdm9sMiBzZWN0aW9uCj4+PiAxNS40
IGZvciBtb3JlIGRldGFpbHMuwqAgVk1NQ0FMTCBpc24ndCBjaGVja2VkIGR1ZSB0byBndWVzdHMg
bmVlZGluZyBpdAo+Pj4gdG8gYm9vdC4KPj4+Cj4+Cj4+IERvbid0IHlvdSBuZWVkIFNWTUUgYmUg
b24gZm9yIFZNTUNBTEw/Cj4gCj4gSW4gcmVhbCBoYXJkd2FyZSwgeWVzLgo+IAo+IEhvd2V2ZXIs
IGl0J3MgcXVpdGUgdW5yZWFzb25hYmxlIHRvIHJlcXVpcmUgdGhlIGd1ZXN0IHRvIGhhdmUgYWN0
aXZhdGVkCj4gaXRzIGlkZWEgb2YgRUZFUi5TVk1FIGJlZm9yZSBpdCBjYW4gbWFrZSBoeXBlcmNh
bGxzIDopCgoKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
