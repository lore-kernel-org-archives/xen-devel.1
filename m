From: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [PATCH v2 04/18] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 20 Dec 2018 14:41:52 +0000
Message-ID: <69B40F7B-1364-4C15-87EB-3333EDC780AF@citrix.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-5-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lCt/=O5=citrix.com=prvs=885a83768=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1gZzWX-0003os-4d
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:42:05 +0000
In-Reply-To: <1545287955-27684-5-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
Content-ID: <3079795C9357A749BCA202C91986B5BE@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCu+7v09uIDIwLzEyLzIwMTgsIDA2OjM5LCAiQ2hyaXN0b3BoZXIgQ2xhcmsiIDxjaHJpc3Rv
cGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBUaGUgc29mdHdhcmUgbGljZW5z
ZSBvbiB0aGUgcHVibGljIGhlYWRlciBpcyB0aGUgQlNEIGxpY2Vuc2UsIHN0YW5kYXJkDQogICAg
cHJvY2VkdXJlIGZvciB0aGUgcHVibGljIFhlbiBoZWFkZXJzLg0KICAgIA0KVGhhbmsgeW91IGZv
ciBwb3N0aW5nIHRoZSBwYXRjaC4gSSB0aGluayBpdCBpcyBpbXBvcnRhbnQgdG8gbm90ZSB0aGF0
IHRoZXNlIGhlYWRlcnMgd2VyZSBvcmlnaW5hbGx5IHBvc3RlZCB1bmRlciBhIEdQTCBsaWNlbnNl
IGF0IA0KWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxMy0wNS9tc2cwMjcxMC5odG1sIA0KDQpUaGUgZm9sbG93aW5nIEFDSyBpcyB0byBj
b25maXJtIHRoYXQgb25seSBwZW9wbGUgYmVpbmcgZW1wbG95ZWVzIG9mIENpdHJpeCBjb250cmli
dXRlZCB0byB0aGUgaGVhZGVyIGZpbGVzIGluIHRoZSBzZXJpZXMgcG9zdGVkIA0KYXQgWzFdIGFu
ZCB0aGF0IHRodXMgdGhlIGNvcHlyaWdodCBvZiB0aGUgZmlsZXMgaW4gcXVlc3Rpb24gaXMgZnVs
bHkgb3duZWQgYnkgQ2l0cml4LiBUaGUgQUNLIGFsc28gY29uZmlybXMgdGhhdCBDaXRyaXggaXMg
aGFwcHkgZm9yIA0KdGhlIGhlYWRlciBmaWxlcyB0byBiZSBwdWJsaXNoZWQgdW5kZXIgYSBCU0Qg
bGljZW5zZSBpbiB0aGlzIHNlcmllcyAod2hpY2ggaXMgYmFzZWQgb24gWzFdKS4NCg0KQWNrZWQt
Ynk6IExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
