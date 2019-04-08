From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] cpupool: fix ASSERT( c != old_pool )
Date: Mon, 8 Apr 2019 07:09:08 +0200
Message-ID: <31983788-e4e4-5526-04a1-660c00930d0d@suse.com>
References: <1554691246-7249-1-git-send-email-fionali-oc@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDMWv-0003ln-Tk
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 05:09:13 +0000
In-Reply-To: <1554691246-7249-1-git-send-email-fionali-oc@zhaoxin.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: FionaLi-oc <fionali-oc@zhaoxin.com>, xen-devel@lists.xenproject.org
Cc: cobechen@zhaoxin.com, dfaggioli@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDQvMjAxOSAwNDo0MCwgRmlvbmFMaS1vYyB3cm90ZToKPiBBc3NpZ25pbmcgY3B1IHRv
IGNwdXBvb2wgbmVlZG4ndCB0byBzd2l0Y2ggY3B1IHNjaGVkdWxlciB3aGVuCj4gc3lzdGVtIHN0
YXRlIGlzIHJlc3VtZSwgb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgQVNTRVJUIGluCj4gc2NoZWR1
bGVfY3B1X3N3aXRjaCgpLgoKSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIG5lZWRlZCBvbiBj
dXJyZW50IHN0YWdpbmcgdHJlZS4gQ29tbWl0CjY4NzBlYTlkMWZhZDZmYmUyNyBjaGFuZ2VkIHJl
c3VtZSBoYW5kbGluZyBsZWFkaW5nIHRvCmNwdXBvb2xfYXNzaWduX2NwdV9sb2NrZWQoKSBiZWlu
ZyBubyBsb25nZXIgY2FsbGVkIHdoZW4gcmVzdW1pbmcuCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
