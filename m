From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Thu, 4 Oct 2018 17:28:07 +0200
Message-ID: <20181004172807.1eef3a6b__12261.223657015$1538667255$gmane$org@kitsune.suse.cz>
References: <20181001084038.GD18290@dhcp22.suse.cz>
 <d54a8509-725f-f771-72f0-15a9d93e8a49@redhat.com>
 <20181002134734.GT18290@dhcp22.suse.cz>
 <98fb8d65-b641-2225-f842-8804c6f79a06@redhat.com>
 <8736tndubn.fsf@vitty.brq.redhat.com>
 <20181003134444.GH4714@dhcp22.suse.cz>
 <87zhvvcf3b.fsf@vitty.brq.redhat.com>
 <49456818-238e-2d95-9df6-d1934e9c8b53@linux.intel.com>
 <87tvm3cd5w.fsf@vitty.brq.redhat.com>
 <06a35970-e478-18f8-eae6-4022925a5192@redhat.com>
 <20181004061938.GB22173@dhcp22.suse.cz>
 <efd50413-4be4-06c4-5ef0-711fdf05db71@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ka6p=mq=suse.de=msuchanek@srs-us1.protection.inumbo.net>)
 id 1g85Y0-0003I7-Ie
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:28:16 +0000
In-Reply-To: <efd50413-4be4-06c4-5ef0-711fdf05db71@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Rob Herring <robh@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Tatashin <pavel.tatashin@microsoft.com>, linux-s390@v
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCA0IE9jdCAyMDE4IDEwOjEzOjQ4ICswMjAwCkRhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKCm9rLCBzbyB3aGF0IGlzIHRoZSBwcm9ibGVtIGhlcmU/CgpI
YW5kbGluZyB0aGUgaG90cGx1ZyBpbiB1c2Vyc3BhY2UgdGhyb3VnaCB1ZGV2IG1heSBiZSBzdWJv
cHRpbWFsIGFuZAprZXJuZWwgaGFuZGxpbmcgbWlnaHQgYmUgZmFzdGVyIGJ1dCB0aGF0J3Mgb3J0
aG9nb25hbCB0byB0aGUgcHJvYmxlbSBhdApoYW5kLgoKVGhlIHN0YXRlIG9mIHRoZSBhcnQgaXMg
dG8gZGV0ZXJtaW5lIHdoYXQgdG8gZG8gd2l0aCBob3RwbHVnZ2VkIG1lbW9yeQppbiB1c2Vyc3Bh
Y2UgYmFzZWQgb24gcGxhdGZvcm0gYW5kIHZpcnR1YWxpemF0aW9uIHR5cGUuCgpDaGFuZ2luZyB0
aGUgZGVmYXVsdCB0byBkZXBlbmQgb24gdGhlIGRyaXZlciB0aGF0IGFkZGVkIHRoZSBtZW1vcnkK
cmF0aGVyIHRoYW4gcGxhdGZvcm0gdHlwZSBzaG91bGQgc29sdmUgdGhlIGlzc3VlIG9mIFZNcyBn
cm93aW5nCmRpZmZlcmVudCB0eXBlcyBvZiBtZW1vcnkgZGV2aWNlIGVtdWxhdGlvbi4KCkFtIEkg
bWlzc2luZyBzb21ldGhpbmc/CgpUaGFua3MKCk1pY2hhbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
