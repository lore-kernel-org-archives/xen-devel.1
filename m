From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 18:25:39 +0100
Message-ID: <23358.21651.273641.311808@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
 <23358.13791.774484.444256@mariner.uk.xensource.com>
 <341794021.20180705174025@eikelenboom.it>
 <23358.17933.141197.826134@mariner.uk.xensource.com>
 <FB11B977-C6B6-4A82-BB05-00D5F701D67B@citrix.com>
 <d5942e06-98cc-63dc-549c-dd3e471ca125@citrix.com>
 <23358.20262.278645.448005@mariner.uk.xensource.com>
 <1A6F4982-83F9-48DA-8547-09E9CB31D585@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb80m-0005Zf-1Q
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 17:25:44 +0000
In-Reply-To: <1A6F4982-83F9-48DA-8547-09E9CB31D585@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Sander Eikelenboom <linux@eikelenboom.it>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3Vt
bWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhs
eSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPiBJ
IGRvbuKAmXQgcmVhbGx5IHVuZGVyc3RhbmQgd2h5IHlvdeKAmXJlIG1vcmUgd29ycmllZCBhYm91
dCBhIHRlc3QKPiBjb3JydXB0aW5nIGEgYmFja3VwIHBhcnRpdGlvbiBvciBMVk0gc25hcHNob3Qs
IHRoYW4gb2YgYSB0ZXN0Cj4gY29ycnVwdGluZyBhIGZpbGVzeXN0ZW0gZXZlbiB3aGVuIHRoZSB0
ZXN0IGFjdHVhbGx5IHBhc3NlZC4gIEkgZG9u4oCZdAo+IGhhdmUgdGhlIHNhbWUgZXhwZXJpZW5j
ZSB5b3UgZG8sIGJ1dCBpdCBzZWVtcyBsaWtlIHJhbmRvbSBzdHVmZiBsZWZ0Cj4gb3ZlciBmcm9t
IGEgcHJldmlvdXMgdGVzdCDigJQgZXZlbiBpZiB0aGUgdGVzdCBwYXNzZXMg4oCUIHdvdWxkIGhh
dmUKPiBtb3JlIG9mIGEgY2hhbmNlIG9mIHNjcmV3aW5nIHVwIGEgZnV0dXJlIHRlc3QgdGhhbiBz
b21lIHNvcnQgb2YKPiBjb3JydXB0aW9uIG9mIGFuIExWTSBzbmFwc2hvdCwgYW5kIGV2ZW4gbGVz
cyBzbyBhIGJhY2t1cCBwYXJ0aXRpb24uCgpUaGUgZGlmZmVyZW5jZSBpcyB0aGF0IHRoZXNlIGFy
ZSB0ZXN0cyAqaW4gdGhlIHNhbWUgZmxpZ2h0Ki4gIFRoYXQKbWVhbnMgdGhleSdyZSB0ZXN0aW5n
IHRoZSBzYW1lIHNvZnR3YXJlLgoKSWYgdGVzdCBBIHBhc3NlcywgYnV0IGNvcnJ1cHRzIHRoZSBk
aXNrIHdoaWNoIGlzIGRldGVjdGVkIGJ5IHRlc3QgQgpiZWNhdXNlIHRoZSBob3N0IHdhc24ndCB3
aXBlZCBpbiBiZXR3ZWVuLCBjYXVzaW5nIHRlc3QgQiB0byBmYWlsLCB0aGVuCnRoYXQgaXMgYSBn
ZW51aW5lIHRlc3QgZmFpbHVyZSAtIGFsYmVpdCBvbmUgd2hvc2UgcmVwcm8gY29uZGl0aW9ucyBh
cmUKY29tcGxpY2F0ZWQuICBJJ20gYmV0dGluZyB0aGF0IHRoaXMgd2lsbCBiZSByYXJlIGVub3Vn
aCBub3QgdG8gbWF0dGVyLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
