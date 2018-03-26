From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 01/12] checkpatch: Add xendevicemodel_handle
 to the list of types
Date: Mon, 26 Mar 2018 14:58:42 +0100
Message-ID: <23224.64658.859133.831793@mariner.uk.xensource.com>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520535787-6223-2-git-send-email-ian.jackson@eu.citrix.com>
 <e2f1cee4-8dad-d901-ae2f-51495a855b4e@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=urmw=gq=citrix.com=prvs=6161f7288=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f0Sep-0003GV-GR
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 13:59:31 +0000
In-Reply-To: <e2f1cee4-8dad-d901-ae2f-51495a855b4e@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

UGFvbG8gQm9uemluaSB3cml0ZXMgKCJSZTogW1BBVENIIDAxLzEyXSBjaGVja3BhdGNoOiBBZGQg
eGVuZGV2aWNlbW9kZWxfaGFuZGxlIHRvIHRoZSBsaXN0IG9mIHR5cGVzIik6Cj4gT24gMDgvMDMv
MjAxOCAyMDowMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBUaGlzIGF2b2lkcyBjaGVja3BhdGNo
IG1pc3BhcnNpbmcgKGFzIHN0YXRlbWVudHMpIGxvbmcgZnVuY3Rpb24KPiA+IGRlZmluaXRpb25z
IG9yIGRlY2xhcmF0aW9ucywgd2hpY2ggc29tZXRpbWVzIHN0YXJ0IHdpdGggY29uc3RydWN0cwo+
ID4gbGlrZSB0aGlzOgo+ID4gCj4gPiAgIHN0YXRpYyBpbmxpbmUgaW50IHhlbmRldmljZW1vZGVs
X3JlbG9jYXRlX21lbW9yeSgKPiA+ICAgICAgIHhlbmRldmljZW1vZGVsX2hhbmRsZSAqZG1vZCwg
ZG9taWRfdCBkb21pZCwgLi4uCi4uLgo+IAo+IE9yIGp1c3QgcmVuYW1lIGl0IHNvIHRoYXQgaXQg
aXMgQ2FtZWxDYXNlLiAgVGhlbiBjaGVja3BhdGNoIHdpbGwgYmUgaGFwcHkuCgpJIGNhbiBkbyB0
aGF0IGlmIHlvdSB3YW50LCBhbHRob3VnaCBpdCBzZWVtcyBhIGJpdCBsaWtlIHBvaW50bGVzcwpj
aHVybi4gIElmIEkgZG8gdGhhdCBpdCBvdWdodCB0byBiZSByZW5hbWVkIGFzIHdlbGwgYXMgcmUt
c3BlbGxlZApiZWNhdXNlIHhlbmRldmljZW1vZGVsX2hhbmRsZSBpcyBhY3R1YWxseSBhIHN0cnVj
dCwgbm90IGEgImhhbmRsZSIKKGllLCBub3QgYSBzY2FsYXIpLlsxXSAgU28KICAgcy94ZW5kZXZp
Y2Vtb2RlbF9oYW5kbGUvWGVuZGV2aWNlbW9kZWxJbnRlcmZhY2UvCkkgZ3Vlc3MgPwoKWzFdIElm
IGl0IHdlcmUgYSBzY2FsYXIgQ09ESU5HX1NUWUxFIHNheXMgaXQgc2hvdWxkIGJlIGluIGxvd2Vy
Y2FzZQp3aXRoIF90LiAgVGhpcyBpcyBhIHZpb2xhdGlvbiBvZiB0aGUgQyBzdGFuZGFyZCwgd2hp
Y2ggcmVzZXJ2ZXMgbmFtZXMKZW5kaW5nIF90IGZvciB0aGUgaW1wbGVtZW50YXRpb24uLi4KCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
