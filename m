From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: adjust hvm_interrupt_blocked()
Date: Thu, 25 Oct 2018 05:30:03 -0600
Message-ID: <5BD1A93B02000078001F49CE@prv1-mh.provo.novell.com>
References: <5BC0C4B602000078001F1258@prv1-mh.provo.novell.com>
 <ed21e605-fd60-bdaf-0178-e6b173bd680c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=29w0=nf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gFdq6-0008Fd-7D
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 11:30:10 +0000
In-Reply-To: <ed21e605-fd60-bdaf-0178-e6b173bd680c@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEwLjE4IGF0IDE4OjM3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRnVydGhlcm1vcmUsIEkgYmVsaWV2ZSBldmVuICNNQyBpcyBibG9ja2VkIGJ5IHRoZSBN
T1ZTUyBzaGFkb3csIGJlY2F1c2UKPiB0aGUgcHVycG9zZSBvZiB0aGUgc2hhZG93IGlzIHRvIGlu
ZGljYXRlICJteSBzdGFjayBpcyBub3Qgc2FmZSB0byB0YWtlCj4gYW4gZXhjZXB0aW9uIi4KCkhh
dmluZyB0aG91Z2h0IGFib3V0IHRoaXMgc29tZSBtb3JlIG92ZXIgbHVuY2gsIEknbSBhZnJhaWQg
SQpub3cgdGhpbmsgdGhhdCBib3RoIHZhcmlhbnRzIGFyZSBlcXVhbGx5IGxpa2VseSBkdWUgdG8g
YmVpbmcKZXF1YWxseSByaXNreSAoYXMgdG8gcmVzdWx0aW5nIGluIHNodXRkb3duKTogSWYgdGhl
ICNNQyB3YXMgaW4KYW55IHdheSBmZXRjaC9leGVjdXRpb24gcmVsYXRlZCwgaG9ub3JpbmcgbW92
LXNzLXNoYWRvdwp3b3VsZCBtZWFuIGEgc2Vjb25kICNNQyAob24gdGhlIGZvbGxvd2luZyBpbnN0
cnVjdGlvbikKd291bGQgYmUgZGVhZGx5LgoKPj4gQWRkaXRpb25hbGx5IFNUSS1zaGFkb3cgb25s
eSBibG9ja3MgbWFza2FibGUgaW50ZXJydXB0cywgYnV0IG5vdCBOTUkuCj4gCj4gVGhpcyBoYXMg
YmVlbiBkaXNjdXNzZWQgb24gTEtNTCBpbiB0aGUgcGFzdCwgYnV0IGBTVEk7IEhMVGAgd2lsbAo+
IGRlYWRsb2NrIGlmIE5NSXMgZG9uJ3QgcmVzcGVjdCB0aGUgU1RJIHNoYWRvdy4KPiAKPiBBbiBO
TUkgd2hpY2ggaGl0cyB0aGF0IGluc3RydWN0aW9uIGJvdW5kYXJ5IHdpbGwgSVJFVCB3aXRoIElG
IGNsZWFyLCBhdAo+IHdoaWNoIHBvaW50IHRoZSBjb3JlIHdpbGwgaGFsdCBhbmQgbmV2ZXIgd2Fr
ZSB1cC4KCk5vLiBTVEktc2hhZG93LCBhaXVpLCBkb2VzIG5vdCBkZWxheSB0aGUgc2V0dGluZyBv
ZiBFRkxBR1MuSUYsCmJ1dCBvbmx5IHRoZSByZWNvZ25pdGlvbiBvZiBpbnRlcnJ1cHRzLiBIZW5j
ZSBpbiB5b3VyIHNjZW5hcmlvCnRoZSBOTUkgaGFuZGxlciB3b3VsZCBzZWUgSUYgc2V0IGluIHRo
ZSBzYXZlZCBpbWFnZSBvbiB0aGUgc3RhY2suCgpBcyBhIHJlc3VsdCBJIGRvbid0IGN1cnJlbnRs
eSB0aGluayB0aGUgY2hhbmdlIGlzIGluIGNvbnRyYWRpY3Rpb24KdG8gZG9jdW1lbnRlZCBvciBl
eHBlY3RhYmxlIGJlaGF2aW9yLCBhbmQgaGVuY2UgZm9yIG5vdyBJCmRvbid0IHNlZSByZWFzb25z
IHRvIGFkanVzdCBpdC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
